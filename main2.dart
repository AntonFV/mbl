import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditate',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Meditate',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, size: 28),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              
              const CategoryChips(),

              const SizedBox(height: 25),

              
              const BigCard(),

              const SizedBox(height: 25),

              
              Row(
                children: const [
                  Expanded(
                    child: SmallCard(
                      image: 'assets/sleep_hour.png',
                      bgColor: Color(0xFFF2994A),
                      title: 'The Sleep Hour',
                      subtitle: 'Ashna Mukherjee',
                      sessions: '3 Sessions',
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: SmallCard(
                      image: 'assets/easy_mission.png',
                      bgColor: Color(0xFFF2C94C),
                      title: 'Easy on the Mission',
                      subtitle: 'Peter Mach',
                      sessions: '5 minutes',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                children: const [
                  Expanded(
                    child: SmallCard(
                      image: 'assets/relax.png',
                      bgColor: Color(0xFF2F80ED),
                      title: 'Relax with Me',
                      subtitle: 'Amanda James',
                      sessions: '3 Sessions',
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: SmallCard(
                      image: 'assets/sun_energy.png',
                      bgColor: Color(0xFF009688),
                      title: 'Sun and Energy',
                      subtitle: 'Micheal Hiu',
                      sessions: '5 minutes',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}


class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'All', 'active': true},
      {'name': 'Bible In a Year', 'active': false},
      {'name': 'Dailies', 'active': false},
      {'name': 'Minutes', 'active': false},
      {'name': 'Novena', 'active': false},
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isActive = cat['active'] as bool;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF009688) : const Color(0xFFE0F7FA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                cat['name'] as String,
                style: TextStyle(
                  color: isActive ? Colors.white : const Color(0xFF00897B),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 180,
            width: double.infinity,
            color: const Color(0xFFF2C94C), 
            child: Image.asset(
              'assets/sun_moon.png',
               
            ),
          ),
        ),
        const SizedBox(height: 15),

        const Text(
          'A Song of Moon',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
          'Start with the basics',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
            const SizedBox(width: 5),
            const Text(
              '9 Sessions',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const Spacer(),
            const Text(
              'Start',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.chevron_right, size: 18),
          ],
        ),
      ],
    );
  }
}


class SmallCard extends StatelessWidget {
  final String image;
  final Color bgColor;
  final String title;
  final String subtitle;
  final String sessions;

  const SmallCard({
    super.key,
    required this.image,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.sessions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 110,
            width: double.infinity,
            color: bgColor,
            child: Image.asset(
              image,
            ),
          ),
        ),
        const SizedBox(height: 10),

        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),

        Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            const Icon(Icons.favorite_border, size: 14, color: Colors.grey),
            const SizedBox(width: 3),
            Text(
              sessions,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            const Spacer(),
            const Text(
              'Start',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.chevron_right, size: 14),
          ],
        ),
      ],
    );
  }
}