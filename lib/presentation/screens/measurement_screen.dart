import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../domain/entities/blood_gas_record.dart';
import '../state/measurement_state.dart';
import '../state/providers.dart';

class MeasurementScreen extends ConsumerWidget {
  final String patientId;
  final BloodGasRecord? existingRecord;

  const MeasurementScreen({super.key, required this.patientId, this.existingRecord});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _MeasurementContent(patientId: patientId, existingRecord: existingRecord);
  }
}

class _MeasurementContent extends ConsumerStatefulWidget {
  final String patientId;
  final BloodGasRecord? existingRecord;
  const _MeasurementContent({required this.patientId, this.existingRecord});

  @override
  ConsumerState<_MeasurementContent> createState() => _MeasurementContentState();
}

class _MeasurementContentState extends ConsumerState<_MeasurementContent> {
  bool _isProcessing = false;
  bool _showEmptyFields = false;
  final Set<String> _emptyFieldKeys = {};
  String? _editingKey; // Track which field is being edited

  /// All form fields with their canonical keys
  static const _fieldDefinitions = <_FieldDef>[
    // Blood Gas Values
    _FieldDef('pH', 'pH', ''),
    _FieldDef('pCO2', 'pCO2', 'mmHg'),
    _FieldDef('pO2', 'pO2', 'mmHg'),
    // Oximetry
    _FieldDef('ctHb', 'ctHb', 'g/dL'),
    _FieldDef('Hctc', 'hctc', '%'),
    _FieldDef('sO2', 'sO2', '%'),
    _FieldDef('FO2Hb', 'fO2Hb', '%'),
    _FieldDef('FCOHb', 'fCOHb', '%'),
    _FieldDef('FHHb', 'fHHb', '%'),
    _FieldDef('FMetHb', 'fMetHb', '%'),
    // Electrolytes
    _FieldDef('cK+', 'cK', 'mmol/L'),
    _FieldDef('cNa+', 'cNa', 'mmol/L'),
    _FieldDef('cCa2+', 'cCa', 'mmol/L'),
    _FieldDef('cCl-', 'cCl', 'mmol/L'),
    // Metabolites
    _FieldDef('cGlu', 'cGlu', 'mmol/L'),
    _FieldDef('cLac', 'cLac', 'mmol/L'),
    _FieldDef('ctBil', 'ctBil', 'mmol/L'),
    _FieldDef('mOsmc', 'mOsmc', 'mmol/kg'),
    // Temperature Corrected
    _FieldDef('pH(T)', 'phT', ''),
    _FieldDef('pCO2(T)', 'pCO2T', 'kPa'),
    _FieldDef('pO2(T)', 'pO2T', 'kPa'),
    // Oxygen Status
    _FieldDef('ctO2c', 'ctO2c', 'vol%'),
    _FieldDef('p50c', 'p50c', 'kPa'),
    // Acid Base Status
    _FieldDef('cBase(B)c', 'cBaseB', 'mmol/L'),
    _FieldDef('cBase(Ecf)c', 'cBaseEcf', 'mmol/L'),
    _FieldDef('cHCO3-(P.st)', 'cHCO3Pst', 'mmol/L'),
    _FieldDef('cHCO3-(P)c', 'cHCO3P', 'mmol/L'),
  ];

  /// Map of key → TextEditingController
  late final Map<String, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();

    // Create a controller for each field
    _controllers = {
      for (final def in _fieldDefinitions)
        def.key: TextEditingController(),
    };

    // Initialize
    Future.microtask(() {
      if (widget.existingRecord != null) {
        ref.read(measurementFormProvider(widget.patientId).notifier).setFromRecord(widget.existingRecord!);
        _syncControllersFromState(widget.existingRecord!);
      } else {
        ref.read(measurementFormProvider(widget.patientId).notifier).reset();
      }
    });
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  /// Syncs TextEditingControllers from a BloodGasRecord state
  void _syncControllersFromState(BloodGasRecord record) {
    final valueMap = _recordToMap(record);
    for (final def in _fieldDefinitions) {
      // Don't overwrite the field the user is currently editing
      if (def.key == _editingKey) continue;
      final val = valueMap[def.key];
      final text = val != null ? _formatDouble(val) : '';
      if (_controllers[def.key]!.text != text) {
        _controllers[def.key]!.text = text;
      }
    }
  }

  String _formatDouble(double v) {
    // Use toString() for natural representation — no forced decimal places
    if (v == v.roundToDouble()) return v.toInt().toString();
    return v.toString();
  }

  Map<String, double?> _recordToMap(BloodGasRecord r) => {
    'pH': r.pH, 'pCO2': r.pCO2, 'pO2': r.pO2,
    'ctHb': r.ctHb, 'hctc': r.hctc, 'sO2': r.sO2,
    'fO2Hb': r.fO2Hb, 'fCOHb': r.fCOHb, 'fHHb': r.fHHb, 'fMetHb': r.fMetHb,
    'cNa': r.cNa, 'cK': r.cK, 'cCa': r.cCa, 'cCl': r.cCl,
    'cGlu': r.cGlu, 'cLac': r.cLac, 'ctBil': r.ctBil, 'mOsmc': r.mOsmc,
    'phT': r.phT, 'pCO2T': r.pCO2T, 'pO2T': r.pO2T,
    'ctO2c': r.ctO2c, 'p50c': r.p50c,
    'cBaseB': r.cBaseB, 'cBaseEcf': r.cBaseEcf,
    'cHCO3Pst': r.cHCO3Pst, 'cHCO3P': r.cHCO3P,
  };

  File? _imageFile; // To store the cropped image

  @override
  Widget build(BuildContext context) {
    // Listen to form state so OCR updates propagate to controllers
    ref.listen<BloodGasRecord>(
      measurementFormProvider(widget.patientId),
      (previous, next) {
        _syncControllersFromState(next);
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(widget.existingRecord != null ? 'Ölçümü Düzenle' : 'Yeni Ölçüm'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // 1. TOP SECTION: IMAGE VIEW (If available)
              if (_imageFile != null)
                Expanded(
                  flex: 4, // 40% of screen
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    child: InteractiveViewer(
                      minScale: 1.0,
                      maxScale: 5.0,
                      child: Image.file(_imageFile!),
                    ),
                  ),
                ),
              
              // 2. BOTTOM SECTION: FORM & BUTTONS
              Expanded(
                flex: 6, // 60% of screen (or 100% if no image)
                child: Container(
                  color: const Color(0xFF121218),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                         // Camera/Gallery Buttons (only if no image, or maybe small icon to retake?)
                         if (_imageFile == null) ...[
                            _buildBigButton(
                              icon: Icons.camera_alt, 
                              label: 'Kamera ile Tara', 
                              onTap: () => _pickImage(ImageSource.camera),
                              color: const Color(0xFF00897B),
                            ),
                            const SizedBox(height: 12),
                            _buildBigButton(
                              icon: Icons.photo_library, 
                              label: 'Galeriden Seç', 
                              onTap: () => _pickImage(ImageSource.gallery),
                              color: const Color(0xFF00695C),
                            ),
                            const Divider(height: 32),
                         ] else ...[
                            // Retake options
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 TextButton.icon(
                                   onPressed: () => _pickImage(ImageSource.camera),
                                   icon: const Icon(Icons.camera_alt), 
                                   label: const Text('Tekrar Çek'),
                                 ),
                                 TextButton.icon(
                                   onPressed: () => _pickImage(ImageSource.gallery),
                                   icon: const Icon(Icons.photo_library), 
                                   label: const Text('Galeriden Seç'),
                                 ),
                               ],
                            ),
                            const Divider(),
                         ],

                        // Form sections
                        _buildSection('Kan Gazı Değerleri', 0, 3),
                        _buildSection('Oksimetri Değerleri', 3, 10),
                        _buildSection('Elektrolit Değerleri', 10, 14),
                        _buildSection('Metabolit Değerleri', 14, 18),
                        _buildSection('Sıcaklık Düzeltmeli', 18, 21),
                        _buildSection('Oksijen Durumu', 21, 23),
                        _buildSection('Asit-Baz Durumu', 23, 27),

                        const SizedBox(height: 24),
                        
                        // Save Button
                        SizedBox(
                          height: 56, // Taller button
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00897B),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            onPressed: _onSave,
                            child: Text(
                              widget.existingRecord != null ? 'GÜNCELLE' : 'KAYDET',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          if (_isProcessing)
            Container(
              color: Colors.black54,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
  
  Widget _buildBigButton({required IconData icon, required String label, required VoidCallback onTap, required Color color}) {
      return SizedBox(
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: _isProcessing ? null : onTap,
          icon: Icon(icon, size: 28),
          label: Text(label, style: const TextStyle(fontSize: 18)),
        ),
      );
  }

  Widget _buildSection(String title, int startIdx, int endIdx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4DB6AC), fontSize: 16)),
        const SizedBox(height: 8),
        for (int i = startIdx; i < endIdx; i++)
          _buildField(_fieldDefinitions[i]),
      ],
    );
  }

  Widget _buildField(_FieldDef def) {
    final label = def.unit.isNotEmpty ? '${def.label} (${def.unit})' : def.label;
    final isEmpty = _showEmptyFields && _emptyFieldKeys.contains(def.key);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isEmpty ? Colors.red.shade300 : Colors.white70,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              controller: _controllers[def.key],
              onTap: () => _editingKey = def.key,
              keyboardType: TextInputType.text,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,\-]')),
              ],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                enabledBorder: isEmpty
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red.shade400, width: 1.5),
                      )
                    : null,
              ),
              onChanged: (val) {
                // Don't update state while user is still typing a number
                // e.g. "7." or "-" are incomplete inputs
                final trimmed = val.replaceAll(',', '.').trim();
                if (trimmed.isEmpty) {
                  ref.read(measurementFormProvider(widget.patientId).notifier).updateField(def.key, null);
                  return;
                }
                if (trimmed.endsWith('.') || trimmed.endsWith('-') || trimmed == '.') {
                  return; // Don't update state yet — user is still typing
                }
                final d = double.tryParse(trimmed);
                ref.read(measurementFormProvider(widget.patientId).notifier).updateField(def.key, d);
                // Remove from empty set if user fills it
                if (d != null && _emptyFieldKeys.contains(def.key)) {
                  setState(() => _emptyFieldKeys.remove(def.key));
                }
              },
              onEditingComplete: () => _editingKey = null,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      setState(() => _isProcessing = true);
      print('[MeasurementScreen] Starting image pick, source: $source');

      final picker = ImagePicker();
      final picked = await picker.pickImage(source: source);
      if (picked == null) {
        print('[MeasurementScreen] Image picking cancelled');
        setState(() => _isProcessing = false);
        return;
      }
      print('[MeasurementScreen] Image picked: ${picked.path}');

      // Crop
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: picked.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Kırp ve Düzenle',
            toolbarColor: Colors.teal, // Updated color
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(title: 'Kırp'),
        ],
      );

      if (croppedFile == null) {
        print('[MeasurementScreen] Crop cancelled');
        setState(() => _isProcessing = false);
        return;
      }
      print('[MeasurementScreen] Image cropped: ${croppedFile.path}');
      
      // Update state to show image in split view
      setState(() {
         _imageFile = File(croppedFile.path);
      });

      // Run OCR
      final ocr = ref.read(ocrServiceProvider);
      print('[MeasurementScreen] Running OCR...');
      final values = await ocr.processImage(croppedFile.path);
      print('[MeasurementScreen] OCR returned ${values.length} values');

      // Update form — the ref.listen above will sync controllers
      ref.read(measurementFormProvider(widget.patientId).notifier).setFromOcr(values);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OCR: ${values.length} değer bulundu')),
        );
      }
    } catch (e, st) {
      print('[MeasurementScreen] ERROR: $e');
      print('[MeasurementScreen] Stack: $st');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  Future<void> _onSave() async {
    // Find empty fields
    final emptyKeys = <String>[];
    for (final def in _fieldDefinitions) {
      final ctrl = _controllers[def.key];
      if (ctrl == null || ctrl.text.trim().isEmpty) {
        emptyKeys.add(def.key);
      }
    }

    if (emptyKeys.isEmpty) {
      // All fields filled — show verification warning
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 24),
              SizedBox(width: 10),
              Expanded(child: Text('Dikkat!', style: TextStyle(fontSize: 18))),
            ],
          ),
          content: const Text(
            'Görüntü işleme her zaman doğru analiz edemeyebilir.\n\n'
            'Lütfen değerleri tekrar kontrol ettiğinizden emin olun.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Geri Dön'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Kontrol Ettim, Kaydet'),
            ),
          ],
        ),
      );
      if (confirmed != true) return;
    }

    if (emptyKeys.isNotEmpty) {
      // Highlight empty fields
      setState(() {
        _showEmptyFields = true;
        _emptyFieldKeys
          ..clear()
          ..addAll(emptyKeys);
      });

      // Show confirmation dialog
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Eksik Bilgiler'),
          content: Text(
            '${emptyKeys.length} adet alan boş bırakılmış.\n\n'
            'Eksik bilgileri doldurmadan devam etmek istediğinize emin misiniz?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hayır'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Evet'),
            ),
          ],
        ),
      );

      if (confirmed != true) return; // User chose "Hayır"
    }

    if (widget.existingRecord != null) {
      await ref.read(measurementFormProvider(widget.patientId).notifier).updateExistingRecord();
    } else {
      await ref.read(measurementFormProvider(widget.patientId).notifier).save();
    }
    if (mounted) Navigator.pop(context);
  }
}

/// Simple field definition helper
class _FieldDef {
  final String label;
  final String key;
  final String unit;
  const _FieldDef(this.label, this.key, this.unit);
}
