import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/blood_gas_record.dart';
import '../state/blood_gas_state.dart';
import 'measurement_screen.dart';

class ResultDetailScreen extends ConsumerWidget {
  final String patientId;
  final BloodGasRecord record;

  const ResultDetailScreen({
    super.key,
    required this.patientId,
    required this.record,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(patientBloodGasRecordsProvider(patientId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuç: ${DateFormat('HH:mm - dd MMM', 'tr_TR').format(record.timestamp)}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Düzenle',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => MeasurementScreen(
                    patientId: patientId,
                    existingRecord: record,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: recordsAsync.when(
        data: (records) {
          final index = records.indexWhere((r) => r.id == record.id);
          final previous = (index != -1 && index + 1 < records.length)
              ? records[index + 1]
              : null;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Legal disclaimer footer
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  'Bu uygulama klinik asistan aracıdır. Tıbbi tavsiye vermez. '
                  'Değerleri her zaman orijinal basılı raporla doğrulayın.',
                  style: TextStyle(fontSize: 11, color: Colors.grey, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(),

              // Blood Gas Values
              _sectionHeader('Kan Gazı Değerleri'),
              _buildRow('pH', record.pH, previous?.pH),
              _buildRow('pCO2', record.pCO2, previous?.pCO2, unit: 'mmHg'),
              _buildRow('pO2', record.pO2, previous?.pO2, unit: 'mmHg'),

              const Divider(),
              _sectionHeader('Oksimetri Değerleri'),
              _buildRow('ctHb', record.ctHb, previous?.ctHb, unit: 'g/dL'),
              _buildRow('Hctc', record.hctc, previous?.hctc, unit: '%'),
              _buildRow('sO2', record.sO2, previous?.sO2, unit: '%'),
              _buildRow('FO2Hb', record.fO2Hb, previous?.fO2Hb, unit: '%'),
              _buildRow('FCOHb', record.fCOHb, previous?.fCOHb, unit: '%'),
              _buildRow('FHHb', record.fHHb, previous?.fHHb, unit: '%'),
              _buildRow('FMetHb', record.fMetHb, previous?.fMetHb, unit: '%'),

              const Divider(),
              _sectionHeader('Elektrolit Değerleri'),
              _buildRow('cNa+', record.cNa, previous?.cNa, unit: 'mmol/L'),
              _buildRow('cK+', record.cK, previous?.cK, unit: 'mmol/L'),
              _buildRow('cCa2+', record.cCa, previous?.cCa, unit: 'mmol/L'),
              _buildRow('cCl-', record.cCl, previous?.cCl, unit: 'mmol/L'),

              const Divider(),
              _sectionHeader('Metabolit Değerleri'),
              _buildRow('cGlu', record.cGlu, previous?.cGlu, unit: 'mmol/L'),
              _buildRow('cLac', record.cLac, previous?.cLac, unit: 'mmol/L'),
              _buildRow('ctBil', record.ctBil, previous?.ctBil, unit: 'mmol/L'),
              _buildRow('mOsmc', record.mOsmc, previous?.mOsmc, unit: 'mmol/kg'),

              const Divider(),
              _sectionHeader('Sıcaklık Düzeltmeli'),
              _buildRow('pH(T)', record.phT, previous?.phT),
              _buildRow('pCO2(T)', record.pCO2T, previous?.pCO2T, unit: 'kPa'),
              _buildRow('pO2(T)', record.pO2T, previous?.pO2T, unit: 'kPa'),

              const Divider(),
              _sectionHeader('Oksijen Durumu'),
              _buildRow('ctO2c', record.ctO2c, previous?.ctO2c, unit: 'vol%'),
              _buildRow('p50c', record.p50c, previous?.p50c, unit: 'kPa'),

              const Divider(),
              _sectionHeader('Asit-Baz Durumu'),
              _buildRow('cBase(B)c', record.cBaseB, previous?.cBaseB, unit: 'mmol/L'),
              _buildRow('cBase(Ecf)c', record.cBaseEcf, previous?.cBaseEcf, unit: 'mmol/L'),
              _buildRow('cHCO3-(P.st)', record.cHCO3Pst, previous?.cHCO3Pst, unit: 'mmol/L'),
              _buildRow('cHCO3-(P)c', record.cHCO3P, previous?.cHCO3P, unit: 'mmol/L'),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _buildRow(String label, double? current, double? previous, {String unit = ''}) {
    if (current == null) return const SizedBox.shrink();

    String diffText = '';
    Color color = Colors.white;
    IconData? icon;

    if (previous != null) {
      final diff = current - previous;
      if (diff.abs() > 0.01) {
        final arrow = diff > 0 ? '↑' : '↓';
        diffText = '${diff > 0 ? '+' : ''}${diff.toStringAsFixed(2)} $arrow';
        color = diff > 0 ? Colors.orangeAccent : Colors.lightBlueAccent;
        icon = diff > 0 ? Icons.arrow_upward : Icons.arrow_downward;
      } else {
        diffText = '=';
        color = Colors.grey;
      }
    } else {
      diffText = 'Yeni';
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unit.isNotEmpty ? '$label ($unit)' : label,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  current.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  previous != null ? 'Önceki: ${previous.toStringAsFixed(2)}' : '',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(diffText, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
                    if (icon != null) Icon(icon, size: 16, color: color),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
