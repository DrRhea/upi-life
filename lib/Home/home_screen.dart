import 'package:flutter/material.dart';
import '../MentalHealth/mental_health_screen.dart'; // Impor halaman Mental Health

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI SuperApp'),
        centerTitle: true,
      ),
      body: GridView.builder(
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
              if (feature.title == 'Mental Health') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MentalHealthScreen(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${feature.title} belum diimplementasikan'),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class Feature {
  final String title;
  final IconData icon;

  Feature({
    required this.title,
    required this.icon,
  });
}

final List<Feature> _features = [
  Feature(
    title: 'Mental Health',
    icon: Icons.health_and_safety,
  ),
  Feature(
    title: 'Akademik',
    icon: Icons.school,
  ),
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

  const _FeatureCard({
    required this.feature,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap, // Menggunakan Navigator 1.0
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              feature.icon,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              feature.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
