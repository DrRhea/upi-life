import 'package:flutter/material.dart';

class ELearningScreen extends StatelessWidget {
  const ELearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E Learning'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () {
              // Tambahkan aksi untuk pesan
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Tambahkan aksi untuk notifikasi
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.public, size: 50),
                const SizedBox(height: 8),
                Container(
                  height: 20,
                  width: 100,
                  color: Colors.grey[300],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.phone), onPressed: () {}),
            IconButton(icon: const Icon(Icons.book), onPressed: () {}),
            const SizedBox(width: 40), // Untuk memberi ruang ke floating button
            IconButton(icon: const Icon(Icons.work), onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.calendar_today), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.public),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
