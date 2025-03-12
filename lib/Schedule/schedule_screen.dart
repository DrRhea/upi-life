import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule & To-Do'),
        backgroundColor: Colors.red,
        actions: const [
          Icon(Icons.chat_bubble_outline),
          SizedBox(width: 16),
          Icon(Icons.notifications_none),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCalendar(),
            const SizedBox(height: 16),
            _buildToDoList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: const Icon(Icons.public, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'February',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Icon(Icons.arrow_drop_down)
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(28, (index) {
              return CircleAvatar(
                backgroundColor: index % 7 == 0 ? Colors.red : Colors.grey[400],
                child: Text('${index + 1}'),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildToDoList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('To-Do Task'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.check, color: Colors.green),
                  SizedBox(width: 8),
                  Icon(Icons.settings),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.phone),
          Icon(Icons.smartphone),
          SizedBox(width: 48),
          Icon(Icons.work),
          Icon(Icons.calendar_month),
        ],
      ),
    );
  }
}
