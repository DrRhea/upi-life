import 'package:flutter/material.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: const [
          Icon(Icons.chat_bubble_outline),
          SizedBox(width: 16),
          Icon(Icons.notifications_none),
          SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey[200],
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: Text('User $index'),
                    );
                  },
                ),
              ),
            ),
          Expanded(
            flex: 6,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(),
                        title: Text('User $index'),
                        subtitle: const Text('2 hours ago'),
                      ),
                      Container(
                        height: 200,
                        color: Colors.grey[300],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.thumb_up_outlined),
                            Icon(Icons.chat_bubble_outline),
                            Icon(Icons.share),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home),
            Icon(Icons.list),
            CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.add, color: Colors.white),
            ),
            Icon(Icons.mail),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}
