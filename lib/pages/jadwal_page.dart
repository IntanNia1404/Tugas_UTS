import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  final List<Map<String, String>> jadwal = const [
    {'hari': 'Senin', 'mataKuliah': 'Metodologi Penelitian - 08:00', 'Jumlah Sks': '3'},
    {'hari': 'Selasa', 'mataKuliah': 'Praktikum PBM - 13:50', 'Jumlah Sks': '1'},
    {'hari': 'Rabu', 'mataKuliah': 'Manajemen Proyek - 09:40', 'Jumlah Sks': '3'},
    {'hari': 'Kamis', 'mataKuliah': 'Computer Forensic - 10:30', 'Jumlah Sks': '3'},
    {'hari': 'Jumat', 'mataKuliah': 'Geoinformatika - 08:00', 'Jumlah Sks': '2'},
  ];

  String getQuote() {
    return '📌 Lakukan yang terbaik di semua kesempatan yang kamu miliki';
  }

  String getToday() {
    final weekdays = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
    final todayIndex = DateTime.now().weekday - 1;
    return weekdays[todayIndex >= 0 && todayIndex < 7 ? todayIndex : 0];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final today = getToday();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Kuliah'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        leading: IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Kembali ke Home',
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  getQuote(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: jadwal.length,
                  itemBuilder: (context, index) {
                    final item = jadwal[index];
                    final isToday = item['hari'] == today;

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      color: isToday ? Colors.pink.shade100 : null,
                      elevation: isToday ? 4 : 2,
                      child: ListTile(
                        title: Text(
                          item['hari']!,
                          style: TextStyle(
                            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                            color: isToday ? Colors.pink.shade800 : null,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['mataKuliah']!,
                              style: const TextStyle(color: Colors.pink),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'SKS: ${item['Jumlah Sks']}',
                              style: const TextStyle(fontSize: 12, color: Colors.redAccent),
                            ),
                          ],
                        ),
                        trailing: isToday
                            ? const Icon(Icons.star, color: Colors.white)
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
