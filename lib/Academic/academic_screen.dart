import 'package:flutter/material.dart';

class AcademicScreen extends StatelessWidget {
  const AcademicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akademik'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Akademik',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.chat_bubble, color: Colors.white),
                    SizedBox(width: 16),
                    Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _InfoCard(title: 'Perolehan SKS\n120'),
                _InfoCard(title: 'IPK\n3.75'),
                _InfoCard(title: 'Lama Studi\n4 Tahun'),
                _InfoCard(title: 'Status\nAktif'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    _buildTable('Semester 1', [
                      ['Matematika Dasar', '3', 'A'],
                      ['Fisika Dasar', '3', 'B+'],
                      ['Algoritma dan Pemrograman', '3', 'A-'],
                      ['Pengantar Teknologi Informasi', '3', 'A'],
                    ]),
                    SizedBox(height: 20),
                    _buildTable('Semester 2', [
                      ['Struktur Data', '3', 'A'],
                      ['Basis Data', '3', 'A-'],
                      ['Jaringan Komputer', '3', 'B+'],
                      ['Sistem Operasi', '3', 'A'],
                    ]),
                    SizedBox(height: 20),
                    _buildTable('Semester 3', [
                      ['Pemrograman Mobile', '3', 'A'],
                      ['Kecerdasan Buatan', '3', 'B+'],
                      ['Interaksi Manusia dan Komputer', '3', 'A-'],
                      ['Keamanan Siber', '3', 'A'],
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Kontak'),
          BottomNavigationBarItem(icon: Icon(Icons.tablet), label: 'Perangkat'),
          BottomNavigationBarItem(icon: Icon(Icons.language), label: 'Web'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Karier'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Jadwal'),
        ],
      ),
    );
  }

  Widget _buildTable(String title, List<List<String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        SizedBox(
          width: 600,
          child: DataTable(
            columnSpacing: 20,
            columns: const [
              DataColumn(label: Text('Mata Kuliah')),
              DataColumn(label: Text('SKS')),
              DataColumn(label: Text('Nilai')),
            ],
            rows: data
                .map(
                  (row) => DataRow(
                    cells: row.map((cell) => DataCell(Text(cell))).toList(),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  const _InfoCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
