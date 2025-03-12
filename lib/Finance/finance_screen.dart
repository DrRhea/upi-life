import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Saldo Anda',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(height: 8),
                Text('Rp12.500.000',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(1, 2),
                        FlSpot(2, 3),
                        FlSpot(3, 2.5),
                        FlSpot(4, 3.5),
                        FlSpot(5, 3),
                        FlSpot(6, 4),
                      ],
                      isCurved: true,
                      color: Colors.red,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Riwayat Transaksi',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      children: const [
                        _TransactionCard(
                            title: 'Pembayaran UKT',
                            date: '4 Feb 2025',
                            amount: '-Rp5.000.000'),
                        _TransactionCard(
                            title: 'Refund Biaya Kuliah',
                            date: '20 Jan 2025',
                            amount: '+Rp1.000.000',
                            isIncome: true),
                        _TransactionCard(
                            title: 'Beli Buku',
                            date: '15 Jan 2025',
                            amount: '-Rp200.000'),
                        _TransactionCard(
                            title: 'Transfer ke Rekan',
                            date: '10 Jan 2025',
                            amount: '-Rp1.500.000'),
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

class _TransactionCard extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final bool isIncome;

  const _TransactionCard({
    required this.title,
    required this.date,
    required this.amount,
    this.isIncome = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(isIncome ? Icons.download : Icons.upload_file,
            color: isIncome ? Colors.green : Colors.red),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(amount,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isIncome ? Colors.green : Colors.red)),
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
