import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List emoji dan URL YouTube
  final List<Map<String, String>> emojiList = [
    {
      'emoji': '🏐',
      'url': 'https://www.youtube.com/watch?v=lJOd1yNe-CU&pp=ygUbYmUgdGhlIGNoYW5nZSByYW4gdGFrYWhhc2hp',
    },
    {
      'emoji': '🏐',
      'url': 'https://www.youtube.com/watch?v=kZLZEQFvWDU&t=1683s&pp=ygUbYmUgdGhlIGNoYW5nZSByYW4gdGFrYWhhc2hp',
    },
    {
      'emoji': '🏐',
      'url': 'https://www.youtube.com/watch?v=Ggv8pUdCnkg&t=574s&pp=ygUbYmUgdGhlIGNoYW5nZSByYW4gdGFrYWhhc2hp',
    },
  ];

  // Method membuka URL YouTube
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header dengan gambar dan emoji
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  // Background image
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/yuki.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Dark overlay
                  Container(
                    height: 300,
                    color: Colors.black.withOpacity(0.3),
                  ),

                  // Teks dan emoji
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Widyantari Nuriyanti',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '5026221137',
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          const Spacer(),

                          // Emoji bar di tengah bawah gambar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: emojiList.map((item) {
                              return GestureDetector(
                                onTap: () => _launchURL(item['url']!),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    item['emoji']!,
                                    style: TextStyle(fontSize: 32),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Konten putih di bawah
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Aku suka apa sih?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Exercise cards
                    _buildExerciseCard(
                      color: Colors.orange,
                      title: 'Nonton Voli',
                      subtitle: 'VNL is getting closer',
                      icon: Icons.favorite,
                    ),
                    SizedBox(height: 15),
                    _buildExerciseCard(
                      color: Colors.blue,
                      title: 'Baca Komik',
                      subtitle: 'Japans comics',
                      icon: Icons.book,
                    ),
                    SizedBox(height: 15),
                    _buildExerciseCard(
                      color: Colors.pink,
                      title: 'Dengerin Lagu',
                      subtitle: 'Old school songs',
                      icon: Icons.headphones,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget kartu latihan
  Widget _buildExerciseCard({
    required Color color,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }
}


