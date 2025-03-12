import 'package:flutter/material.dart';

class AcademicScreen extends StatelessWidget {
  const AcademicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akademik'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Akademik',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
                _InfoCard(title: 'Perolehan SKS: 120'),
                _InfoCard(title: 'IPK: 3.75'),
                _InfoCard(title: 'Lama Studi: 4 Tahun'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Mata Kuliah')),
                    DataColumn(label: Text('SKS')),
                    DataColumn(label: Text('Nilai')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('Pemrograman Mobile')),
                      DataCell(Text('3')),
                      DataCell(Text('A')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Basis Data')),
                      DataCell(Text('3')),
                      DataCell(Text('A-')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Kecerdasan Buatan')),
                      DataCell(Text('3')),
                      DataCell(Text('B+')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Jaringan Komputer')),
                      DataCell(Text('3')),
                      DataCell(Text('A')),
                    ]),
                  ],
                ),
              ),
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black54,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Kontak'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tablet), label: 'Perangkat'),
              BottomNavigationBarItem(icon: Icon(Icons.language), label: 'Web'),
              BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Karier'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today), label: 'Jadwal'),
            ],
          ),
        ],
      ),
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
        color: Colors.blue,
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
