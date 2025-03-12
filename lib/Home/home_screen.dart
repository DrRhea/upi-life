import 'package:flutter/material.dart';
import '../MentalHealth/mental_health_screen.dart';
import '../Academic/academic_screen.dart';
import '../Finance/finance_screen.dart';
import '../Schedule/schedule_screen.dart';
import '../Notification/notification_screen.dart';
import '../Forum/forum_screen.dart';
import '../SocialMedia/social_media_screen.dart';
import '../ELearning/elearning_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('UPI Life',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildTeamSection(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth < 600 ? 2 : 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: _features.length,
              itemBuilder: (context, index) {
                final feature = _features[index];
                return _FeatureCard(
                  feature: feature,
                  onTap: () {
                    _navigateToFeature(context, feature.title);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Kelompok 4',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Divider(color: Colors.white54, thickness: 1),
          SizedBox(height: 8),
          Text('Arya Jagadditha - NIM 2312239',
              style: TextStyle(fontSize: 16, color: Colors.white70)),
          Text('Zaki Adam - NIM 2304934',
              style: TextStyle(fontSize: 16, color: Colors.white70)),
        ],
      ),
    );
  }

  void _navigateToFeature(BuildContext context, String title) {
    Widget? screen;
    switch (title) {
      case 'Mental Health':
        screen = const MentalHealthScreen();
        break;
      case 'Akademik':
        screen = const AcademicScreen();
        break;
      case 'Keuangan':
        screen = const FinanceScreen();
        break;
      case 'Jadwal & Todo':
        screen = const ScheduleScreen();
        break;
      case 'Notifikasi':
        screen = const NotificationScreen();
        break;
      case 'Pesan & Group':
        screen = const ForumScreen();
        break;
      case 'Medsos':
        screen = const SocialMediaScreen();
        break;
      case 'Elearning':
        screen = const ELearningScreen();
        break;
    }
    if (screen != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen!),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$title belum diimplementasikan')),
      );
    }
  }
}

class Feature {
  final String title;
  final IconData icon;

  Feature({required this.title, required this.icon});
}

final List<Feature> _features = [
  Feature(title: 'Mental Health', icon: Icons.health_and_safety),
  Feature(title: 'Akademik', icon: Icons.school),
  Feature(title: 'Keuangan', icon: Icons.monetization_on),
  Feature(title: 'Medsos', icon: Icons.people),
  Feature(title: 'Elearning', icon: Icons.book_online),
  Feature(title: 'Jadwal & Todo', icon: Icons.calendar_month),
  Feature(title: 'Pesan & Group', icon: Icons.message),
  Feature(title: 'Notifikasi', icon: Icons.notifications),
];

class _FeatureCard extends StatelessWidget {
  final Feature feature;
  final VoidCallback onTap;

  const _FeatureCard({required this.feature, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              feature.icon,
              size: 60,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 12),
            Text(
              feature.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
