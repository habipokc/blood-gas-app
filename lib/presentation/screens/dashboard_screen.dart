import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/patient_state.dart';
import 'patient_detail_screen.dart';
import '../widgets/patient_card.dart';
import 'trash_screen.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Active Patient List
// ─────────────────────────────────────────────────────────────────────────────

class _ActivePatientList extends ConsumerWidget {
  const _ActivePatientList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientsAsync = ref.watch(activePatientsProvider);
    return patientsAsync.when(
      data: (patients) {
        if (patients.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.medical_services_outlined,
                    size: 64, color: Colors.white.withOpacity(0.15)),
                const SizedBox(height: 20),
                const Text(
                  'Aktif Takip Yok',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Yeni bir takip başlatmak için\naşağıdaki butona tıklayın',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 8, bottom: 100),
          itemCount: patients.length,
          itemBuilder: (context, index) {
            final patient = patients[index];
            return PatientCard(
              patient: patient,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) =>
                          PatientDetailScreen(patientId: patient.id)),
                );
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Hata: $err')),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Completed Patient List
// ─────────────────────────────────────────────────────────────────────────────

class _CompletedPatientList extends ConsumerWidget {
  const _CompletedPatientList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientsAsync = ref.watch(completedPatientsProvider);
    return patientsAsync.when(
      data: (patients) {
        if (patients.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline,
                    size: 64, color: Colors.white.withOpacity(0.15)),
                const SizedBox(height: 16),
                Text(
                  'Tamamlanan ameliyat yok',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 8, bottom: 24),
          itemCount: patients.length,
          itemBuilder: (context, index) {
            final patient = patients[index];
            return PatientCard(
              patient: patient,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) =>
                          PatientDetailScreen(patientId: patient.id)),
                );
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Hata: $err')),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Dashboard with Tabs
// ─────────────────────────────────────────────────────────────────────────────

class PatientDashboard extends ConsumerStatefulWidget {
  const PatientDashboard({super.key});

  @override
  ConsumerState<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends ConsumerState<PatientDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isActiveTab = _tabController.index == 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Gas'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Devam Eden'),
            Tab(text: 'Tamamlanan'),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'trash') {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const TrashScreen()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'trash',
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('Silinenler Klasörü'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _ActivePatientList(),
          _CompletedPatientList(),
        ],
      ),
      // --- Item 6 & 7: FAB only on active tab, bigger health-themed button ---
      bottomNavigationBar: isActiveTab
          ? SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () => _showAddPatientDialog(context, ref),
                    icon: const Icon(Icons.add_circle_outline, size: 24),
                    label: const Text('Yeni Takip Başlat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00897B),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  void _showAddPatientDialog(BuildContext context, WidgetRef ref) {
    final orController = TextEditingController();
    final userController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yeni Kan Gazı Takibi Başlat'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: orController,
              decoration: const InputDecoration(
                labelText: 'Ameliyathane No',
                prefixIcon: Icon(Icons.meeting_room_outlined),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: 'Hasta ID',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          FilledButton(
            onPressed: () {
              if (orController.text.isNotEmpty &&
                  userController.text.isNotEmpty) {
                ref.read(activePatientsProvider.notifier).addPatient(
                      orController.text,
                      userController.text,
                    );
                Navigator.pop(context);
              }
            },
            child: const Text('Başlat'),
          ),
        ],
      ),
    );
  }
}
