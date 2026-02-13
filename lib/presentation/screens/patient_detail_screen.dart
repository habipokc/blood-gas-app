import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../state/blood_gas_state.dart';
import '../state/patient_state.dart';
import '../state/providers.dart';
import '../../domain/entities/blood_gas_record.dart';
import 'measurement_screen.dart';
import 'result_detail_screen.dart';

class PatientDetailScreen extends ConsumerWidget {
  final String patientId;

  const PatientDetailScreen({super.key, required this.patientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientAsync = ref.watch(patientDetailsProvider(patientId));
    final recordsAsync = ref.watch(patientBloodGasRecordsProvider(patientId));

    return Scaffold(
      appBar: AppBar(
        title: patientAsync.when(
          data: (p) => Text(
            p != null ? 'Ameliyathane No: ${p.operatingRoomName}' : 'Yükleniyor...',
          ),
          loading: () => const Text('Yükleniyor...'),
          error: (e, s) => const Text('Hata'),
        ),
        actions: [
          patientAsync.when(
            data: (patient) {
              if (patient == null) return const SizedBox.shrink();
              return PopupMenuButton<String>(
                onSelected: (value) async {
                  final repo = ref.read(patientRepositoryProvider);
                  if (value == 'complete') {
                    final updated = patient.copyWith(
                      isActive: !patient.isActive,
                      surgeryEndTime: patient.isActive ? DateTime.now() : null,
                    );
                    await repo.updatePatient(updated);
                    ref.invalidate(activePatientsProvider);
                    ref.invalidate(completedPatientsProvider);
                    if (context.mounted) Navigator.pop(context);
                  } else if (value == 'delete') {
                    // Show confirmation dialog
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Silinenler Klasörüne Taşı'),
                        content: const Text(
                          'Bu ameliyat takibini silinenler klasörüne taşımak istediğinize emin misiniz?\n\n'
                          'Silinenler klasöründen geri döndürebilirsiniz.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, false),
                            child: const Text('İptal'),
                          ),
                          FilledButton(
                            style: FilledButton.styleFrom(backgroundColor: Colors.red.shade700),
                            onPressed: () => Navigator.pop(ctx, true),
                            child: const Text('Silinenler Klasörüne Taşı'),
                          ),
                        ],
                      ),
                    );
                    if (confirmed == true) {
                      await repo.softDeletePatient(patient.id);
                      ref.invalidate(activePatientsProvider);
                      ref.invalidate(completedPatientsProvider);
                      ref.invalidate(deletedPatientsProvider);
                      if (context.mounted) Navigator.pop(context);
                    }
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'complete',
                    child: Row(
                      children: [
                        Icon(
                          patient.isActive ? Icons.check_circle_outline : Icons.play_circle_outline,
                          color: patient.isActive ? Colors.green : const Color(0xFF4DB6AC),
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(patient.isActive
                            ? 'Tamamlandı Olarak İşaretle'
                            : 'Devam Ediyor Olarak İşaretle'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, color: Colors.red.shade400, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          'Silinenler Klasörüne Taşı',
                          style: TextStyle(color: Colors.red.shade400),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: recordsAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment_outlined,
                      size: 64, color: Colors.white.withOpacity(0.15)),
                  const SizedBox(height: 16),
                  const Text(
                    'Henüz ölçüm yok',
                    style: TextStyle(fontSize: 18, color: Colors.white54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Kan gazı ölçümü eklemek için\naşağıdaki butona tıklayın',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.35),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 100),
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return BloodGasRecordTile(
                record: record,
                patientId: patientId,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Hata: $err')),
      ),

      // --- Item 9: Show add button only for active patients ---
      bottomNavigationBar: patientAsync.when(
        data: (patient) {
          if (patient == null || !patient.isActive) return const SizedBox.shrink();
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MeasurementScreen(patientId: patientId),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_a_photo, size: 22),
                  label: const Text('Yeni Ölçüm Ekle'),
                ),
              ),
            ),
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }
}

class BloodGasRecordTile extends StatelessWidget {
  final BloodGasRecord record;
  final String patientId;

  const BloodGasRecordTile({
    super.key,
    required this.record,
    required this.patientId,
  });

  @override
  Widget build(BuildContext context) {
    final timeFormatter = DateFormat('HH:mm');
    final dateFormatter = DateFormat('dd MMM', 'tr_TR');

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ResultDetailScreen(
                patientId: patientId,
                record: record,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              // Time badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF00897B).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      timeFormatter.format(record.timestamp),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF4DB6AC),
                      ),
                    ),
                    Text(
                      dateFormatter.format(record.timestamp),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),

              // Values summary
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _valueChip('pH', record.pH),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _valueChip('pCO₂', record.pCO2),
                        const SizedBox(width: 12),
                        _valueChip('pO₂', record.pO2),
                      ],
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.chevron_right,
                color: Colors.white.withOpacity(0.3),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _valueChip(String label, double? value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          TextSpan(
            text: value != null ? value.toStringAsFixed(1) : '—',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
