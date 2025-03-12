import 'package:flutter/material.dart';

void main() {
  runApp(const MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const MentalHealthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MentalHealthScreen extends StatefulWidget {
  const MentalHealthScreen({super.key});

  @override
  State<MentalHealthScreen> createState() => _MentalHealthScreenState();
}

class _MentalHealthScreenState extends State<MentalHealthScreen> {
  int _currentCarouselIndex = 0;
  int _selectedNavIndex = 2; // Globe icon selected by default
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.85,
  );

  final List<Map<String, String>> _carouselItems = [
    {
      'title': 'Mengelola Stres',
      'description': 'Pelajari teknik sederhana untuk mengurangi stres harian',
    },
    {
      'title': 'Latihan Mindfulness',
      'description': 'Latihan mindfulness harian untuk kejernihan mental',
    },
    {
      'title': 'Kebiasaan Tidur Sehat',
      'description':
          'Tingkatkan kualitas tidur untuk kesehatan mental yang lebih baik',
    },
    {
      'title': 'Pola Makan Sehat',
      'description': 'Nutrisi yang baik membantu menjaga kesehatan mental',
    },
    {
      'title': 'Manajemen Waktu',
      'description': 'Cara mengatur waktu agar tidak merasa terbebani',
    },
  ];

  final List<Map<String, String>> _articleItems = [
    {
      'title': 'Apa Itu Kesehatan Mental?',
      'subtitle': 'Mengapa Kesehatan Mental Itu Penting?',
      'content':
          'Kesehatan mental mencakup kesejahteraan emosional, psikologis, dan sosial kita. Hal ini memengaruhi cara kita berpikir, merasa, dan bertindak. Kesehatan mental juga membantu dalam menangani stres, berhubungan dengan orang lain, dan membuat keputusan...',
    },
    {
      'title': 'Mengatasi Kecemasan',
      'subtitle': 'Strategi Mengelola Kecemasan',
      'content':
          'Kecemasan adalah reaksi normal terhadap stres dan bisa bermanfaat dalam beberapa situasi. Namun, kecemasan berlebihan bisa menjadi masalah jika mengganggu kehidupan sehari-hari. Teknik pernapasan, meditasi, dan olahraga dapat membantu mengatasinya...',
    },
    {
      'title': 'Kesadaran tentang Depresi',
      'subtitle': 'Memahami Tanda dan Gejalanya',
      'content':
          'Depresi adalah gangguan suasana hati yang umum tetapi serius, yang memengaruhi cara seseorang merasa, berpikir, dan menjalani aktivitas sehari-hari. Depresi menyebabkan perasaan sedih yang berkelanjutan dan kehilangan minat terhadap aktivitas yang sebelumnya dinikmati...',
    },
    {
      'title': 'Manfaat Meditasi untuk Kesehatan Mental',
      'subtitle': 'Bagaimana Meditasi Membantu Pikiran Lebih Tenang?',
      'content':
          'Meditasi telah terbukti secara ilmiah membantu mengurangi stres, meningkatkan fokus, dan memperbaiki suasana hati. Dengan latihan rutin, meditasi dapat menjadi alat yang kuat untuk menjaga keseimbangan emosional dan mental...',
    },
    {
      'title': 'Cara Membangun Kebiasaan Positif',
      'subtitle': 'Langkah Kecil Menuju Perubahan Besar',
      'content':
          'Membangun kebiasaan positif seperti bangun lebih awal, berolahraga, atau menulis jurnal harian dapat meningkatkan kesejahteraan mental. Langkah kecil yang konsisten akan membawa dampak besar dalam jangka panjang...',
    },
  ];

  final List<Map<String, String>> _hotlineItems = [
    {
      'name': 'Layanan Konseling Mahasiswa UPI',
      'number': '(022) 2013163',
      'hours': 'Senin-Jumat 08.00-16.00',
    },
    {
      'name': 'Layanan Sehat Jiwa (SEJIWA) KemenPPPA',
      'number': '119 ext. 8',
      'hours': '24/7',
    },
    {
      'name': 'Yayasan Pulih (Dukungan Psikologis)',
      'number': '0813-1833-5686',
      'hours': 'Senin-Jumat 09.00-17.00',
    },
    {
      'name': 'RSUP Dr. Hasan Sadikin Bandung (IGD Psikiatri)',
      'number': '(022) 2034953',
      'hours': '24/7',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Auto-scroll for carousel
    Future.delayed(const Duration(seconds: 1), () {
      _autoScrollCarousel();
    });
  }

  void _autoScrollCarousel() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        int nextPage = (_currentCarouselIndex + 1) % _carouselItems.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
      _autoScrollCarousel();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size to adjust layout
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 1024;
    final bool isTablet = screenSize.width > 768 && screenSize.width <= 1024;

    return Scaffold(
      appBar: _buildAppBar(isDesktop),
      drawer: isDesktop ? null : _buildDrawer(),
      body: Row(
        children: [
          // Side navigation for desktop
          if (isDesktop) _buildSideNavigation(),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 32 : (isTablet ? 24 : 16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    if (isDesktop || isTablet)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Welcome to Mental Health Support',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    _buildCarousel(isDesktop, isTablet),
                    _buildArticleSection(isDesktop, isTablet),
                    _buildHotlineSection(isDesktop),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),

          // Right sidebar for desktop (featured content, etc.)
          if (isDesktop) _buildRightSidebar(),
        ],
      ),
      bottomNavigationBar: isDesktop ? null : _buildBottomNavBar(),
      floatingActionButton:
          isDesktop
              ? null
              : FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.red,
                child: const Icon(Icons.public),
              ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSideNavigation() {
    return Container(
      width: 220,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.public, color: Colors.white),
                ),
                SizedBox(width: 12),
                Text(
                  'Mental Health',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            selected: _selectedNavIndex == 0,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 0;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text('Articles'),
            selected: _selectedNavIndex == 1,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 1;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.public),
            title: const Text('Resources'),
            selected: _selectedNavIndex == 2,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 2;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.work_outline),
            title: const Text('Workshops'),
            selected: _selectedNavIndex == 3,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 3;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Calendar'),
            selected: _selectedNavIndex == 4,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 4;
              });
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: const Text('Crisis Hotlines'),
            onTap: () {},
          ),
          const Spacer(),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {},
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.public, color: Colors.red, size: 30),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Mental Health App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Supporting your wellbeing',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            selected: _selectedNavIndex == 0,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 0;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text('Articles'),
            selected: _selectedNavIndex == 1,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 1;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.public),
            title: const Text('Resources'),
            selected: _selectedNavIndex == 2,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 2;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.work_outline),
            title: const Text('Workshops'),
            selected: _selectedNavIndex == 3,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 3;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Calendar'),
            selected: _selectedNavIndex == 4,
            selectedColor: Colors.red,
            onTap: () {
              setState(() {
                _selectedNavIndex = 4;
              });
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: const Text('Crisis Hotlines'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isDesktop) {
    return AppBar(
      title: const Text(
        'Mental Health',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      centerTitle: isDesktop,
      actions: [
        if (isDesktop)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search resources...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
          ),
        if (isDesktop) ...[
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
        ],
      ],
      bottom:
          isDesktop
              ? null
              : PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  height: 50,
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                            ),
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.notifications_none, color: Colors.black),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget _buildCarousel(bool isDesktop, bool isTablet) {
    final double height = isDesktop ? 220 : (isTablet ? 200 : 180);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isDesktop) ...[
          const Text(
            'Featured Resources',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
        ],
        SizedBox(
          height: height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentCarouselIndex = index;
              });
            },
            itemCount: _carouselItems.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Background pattern or color
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.red.withOpacity(0.1),
                            Colors.blue.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                            isDesktop
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              if (isDesktop) ...[
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.psychology,
                                    color: Colors.red,
                                    size: 32,
                                  ),
                                ),
                                const SizedBox(width: 20),
                              ],
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      isDesktop
                                          ? CrossAxisAlignment.start
                                          : CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      _carouselItems[index]['title']!,
                                      style: TextStyle(
                                        fontSize: isDesktop ? 24 : 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _carouselItems[index]['description']!,
                                      style: TextStyle(
                                        fontSize: isDesktop ? 16 : 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (isDesktop) ...[
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Learn More'),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              _carouselItems.asMap().entries.map((entry) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentCarouselIndex == entry.key
                            ? Colors.red
                            : Colors.grey,
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildArticleSection(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mental Health Articles',
              style: TextStyle(
                fontSize: isDesktop ? 22 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isDesktop)
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),

        // Articles grid/list
        if (isDesktop)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.0,
            ),
            itemCount: _articleItems.length,
            itemBuilder: (context, index) {
              return _buildDesktopArticleCard(
                title: _articleItems[index]['title']!,
                subtitle: _articleItems[index]['subtitle']!,
                content: _articleItems[index]['content']!,
              );
            },
          )
        else if (isTablet)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemCount: _articleItems.length,
            itemBuilder: (context, index) {
              return _buildDesktopArticleCard(
                title: _articleItems[index]['title']!,
                subtitle: _articleItems[index]['subtitle']!,
                content: _articleItems[index]['content']!,
              );
            },
          )
        else
          Column(
            children:
                _articleItems
                    .map(
                      (article) => _buildArticleCard(
                        title: article['title']!,
                        subtitle: article['subtitle']!,
                        content: article['content']!,
                      ),
                    )
                    .toList(),
          ),

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildDesktopArticleCard({
    required String title,
    required String subtitle,
    required String content,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.article, color: Colors.red, size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Text(
                  content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Read More',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleCard({
    required String title,
    required String subtitle,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Read More →',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHotlineSection(bool isDesktop) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.withOpacity(0.2), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone_in_talk, color: Colors.red, size: 24),
                const SizedBox(width: 12),
                Text(
                  'Mental Health Hotlines',
                  style: TextStyle(
                    fontSize: isDesktop ? 22 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Jika butuh bantuan secepatnya, hubungi salah satu helplines di bawah berikut',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isDesktop ? 16 : 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),

            // Hotlines
            if (isDesktop)
              Row(
                children:
                    _hotlineItems
                        .map(
                          (hotline) => Expanded(
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Text(
                                      hotline['name']!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        hotline['number']!,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Available: ${hotline['hours']!}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              )
            else
              Column(
                children:
                    _hotlineItems
                        .map(
                          (hotline) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              children: [
                                Text(
                                  hotline['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  hotline['number']!,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Available: ${hotline['hours']!}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                if (_hotlineItems.last != hotline)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Divider(color: Colors.grey[300]),
                                  ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightSidebar() {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(left: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User profile section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Track your mental health journey',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text('Daily Check-in'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Upcoming events
          const Text(
            'Upcoming Events',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildEventCard(
            'Stress Management Workshop',
            'Tomorrow, 3:00 PM',
            Icons.event_note,
          ),
          _buildEventCard(
            'Mindfulness Meditation',
            'Mar 15, 10:00 AM',
            Icons.self_improvement,
          ),
          _buildEventCard(
            'Support Group Meeting',
            'Mar 18, 5:30 PM',
            Icons.people,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'View All Events',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Quick resources
          const Text(
            'Quick Resources',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildQuickResourceItem('Self-Assessment Tools', Icons.assessment),
          _buildQuickResourceItem('Breathing Exercises', Icons.air),
          _buildQuickResourceItem('Mental Health Journal', Icons.book),
          _buildQuickResourceItem('Therapy Resources', Icons.health_and_safety),
        ],
      ),
    );
  }

  Widget _buildEventCard(String title, String date, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickResourceItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 0),
            _buildNavItem(Icons.book_outlined, 1),
            const SizedBox(width: 40), // Space for FAB
            _buildNavItem(Icons.work_outline, 3),
            _buildNavItem(Icons.calendar_today_outlined, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedNavIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedNavIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.red : Colors.grey),
            const SizedBox(height: 4),
            Container(
              height: 2,
              width: 20,
              color: isSelected ? Colors.red : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
