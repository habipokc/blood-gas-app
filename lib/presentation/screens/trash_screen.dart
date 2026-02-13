import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../state/patient_state.dart';
import '../state/providers.dart';

class TrashScreen extends ConsumerWidget {
  const TrashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deletedAsync = ref.watch(deletedPatientsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Silinenler Klasörü')),
      body: deletedAsync.when(
        data: (patients) {
          if (patients.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete_outline,
                      size: 64, color: Colors.white.withOpacity(0.12)),
                  const SizedBox(height: 16),
                  Text(
                    'Silinenler klasörü boş',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '30 gün sonra otomatik olarak kalıcı silinir',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.25),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              // Info banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                color: Colors.orange.withOpacity(0.08),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange.shade300, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Silinen takipler 30 gün sonra kalıcı olarak silinir.',
                        style: TextStyle(
                          color: Colors.orange.shade200,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  itemCount: patients.length,
                  itemBuilder: (context, index) {
                    final patient = patients[index];
                    final dateFormat = DateFormat('dd MMM yyyy HH:mm', 'tr_TR');
                    final deletedDate = patient.deletedAt != null
                        ? dateFormat.format(patient.deletedAt!)
                        : '—';

                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // Room icon
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red.withOpacity(0.12),
                                  ),
                                  child: Icon(
                                    Icons.meeting_room_outlined,
                                    color: Colors.red.shade300,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ameliyathane: ${patient.operatingRoomName}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Hasta ID: ${patient.residentId}',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Silinme tarihi: $deletedDate',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white.withOpacity(0.35),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Restore button
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  await ref
                                      .read(patientRepositoryProvider)
                                      .restorePatient(patient.id);
                                  ref.invalidate(deletedPatientsProvider);
                                  ref.invalidate(activePatientsProvider);
                                  ref.invalidate(completedPatientsProvider);
                                },
                                icon: const Icon(Icons.restore, size: 18),
                                label: const Text('Silinenlerden Çıkar'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFF4DB6AC),
                                  side: const BorderSide(color: Color(0xFF4DB6AC), width: 0.8),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Center(
                              child: Text(
                                'Geri döndürülen takip tekrar aktif listeye eklenir',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white.withOpacity(0.25),
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Hata: $err')),
      ),
    );
  }
}
