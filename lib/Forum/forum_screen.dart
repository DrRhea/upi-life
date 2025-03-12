import 'package:flutter/material.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Forums', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[300],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.person, size: 40),
              title: Container(
                height: 20,
                color: Colors.black,
              ),
              subtitle: Container(
                margin: const EdgeInsets.only(top: 5),
                height: 40,
                color: Colors.black,
              ),
              trailing: const Text('04.00'),
            ),
          );
        },
      ),
    );
  }
}
