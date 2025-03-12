import 'package:flutter/material.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keuangan'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: const [
          Icon(Icons.chat_bubble, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    color: Colors.grey.shade300,
                    child: const Center(
                        child: Text('Grafik atau Ringkasan Keuangan')),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 80,
                    color: Colors.grey.shade400,
                    child: const Center(child: Text('Fitur Keuangan')),
                  ),
                  const SizedBox(height: 16),
                  const Text('Riwayat Transaksi',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.upload_file),
                          title: Text('Pembayaran UKT'),
                          subtitle: Text('Selasa, 4 Februari 2025'),
                          trailing: Text('Rp5.000.000',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        ListTile(
                          leading: Icon(Icons.download),
                          title: Text('Refund Biaya Kuliah'),
                          subtitle: Text('Senin, 20 Januari 2025'),
                          trailing: Text('Rp1.000.000',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black54,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
              BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Scan'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.language, color: Colors.red), label: 'Web'),
              BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Pesan'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profil'),
            ],
          ),
        ],
      ),
    );
  }
}

// Menambahkan navigasi ke halaman keuangan dari HomeScreen
void navigateToFinanceScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const FinanceScreen()),
  );
}
