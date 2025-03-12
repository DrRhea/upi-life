import 'package:flutter/material.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI Connect'),
        centerTitle: true,
        backgroundColor: Color(0xFFFF0000),
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
                child: ListView(
                  children: const [
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Forum Akademik'),
                    ),
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Event Kampus'),
                    ),
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Komunitas Mahasiswa'),
                    ),
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Bursa Karir'),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Trending Topics',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.trending_up, color: Color(0xFFFF0000)),
                      title: Text('#UPIFestival2025'),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.trending_up, color: Color(0xFFFF0000)),
                      title: Text('#TechInEducation'),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.trending_up, color: Color(0xFFFF0000)),
                      title: Text('#BEMRecruitment2025'),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            flex: 6,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildPost(
                    'Arya Jagadditha',
                    'Kegiatan Pengenalan Kampus UPI sangat seru! Ada banyak seminar inspiratif dan kesempatan networking.',
                    'assets/images/campus_event.jpg',
                    context),
                _buildPost(
                    'Zaki Adam',
                    'Lomba inovasi pendidikan tahun ini luar biasa! Jangan lupa daftar sebelum tanggal 20!',
                    'assets/images/innovation_competition.jpg',
                    context),
                _buildPost(
                    'Fakultas Pendidikan Teknologi',
                    'Seminar "Masa Depan Teknologi dalam Dunia Pendidikan" akan diadakan pada hari Jumat. Gratis untuk semua mahasiswa!',
                    'assets/images/tech_seminar.jpg',
                    context),
                _buildPost(
                    'BEM UPI',
                    'Open recruitment anggota BEM 2025 sudah dibuka! Ayo bergabung dan berkontribusi untuk kampus!',
                    'assets/images/bem_recruitment.jpg',
                    context),
              ],
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
              backgroundColor: Color(0xFFFF0000),
              child: Icon(Icons.add, color: Colors.white),
            ),
            Icon(Icons.mail),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }

  Widget _buildPost(
      String username, String content, String imagePath, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(),
            title: Text(username),
            subtitle: const Text('2 jam yang lalu'),
          ),
          Image.asset(imagePath, height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(content, textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline),
                  onPressed: () {
                    _showComments(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showComments(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: Column(
            children: [
              const Text('Komentar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Rizky Saputra'),
                      subtitle: Text('Semangat untuk acara UPI Festival 2025!'),
                    ),
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Dewi Lestari'),
                      subtitle:
                          Text('Seminarnya sangat bermanfaat, terima kasih!'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
