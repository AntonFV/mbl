import 'package:flutter/material.dart';

void main() {
  runApp(const CourseApp());
}

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D Design Course',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      home: const CourseDetailScreen(),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false, 
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              
              const HeaderBar(),

              const SizedBox(height: 20),

              
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/3d_course.png', 
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              
              const BadgesRow(),

              const SizedBox(height: 25),

              
              const Text(
                '3D Design Basic',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'In this course you will learn how to build a space to a 3-dimensional product. There are 24 premium learning videos for you.',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6B6B6B),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 25),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '24 Lessons (20 hours)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5B6CFF),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              
              const LessonCard(
                title: 'Introduction to 3D',
                duration: '20 mins',
              ),
              const SizedBox(height: 10),
              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: SafeArea(
          top: false,
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: TextButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B6CFF),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                
              ),
              child: const Text(
                'Enroll - \$24.99',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        InkWell(
          onTap: () => Navigator.pop(context), 
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF0FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Color(0xFF5B6CFF),
            ),
          ),
        ),
        const SizedBox(width: 15),
        const Text(
          '3D Design Basic',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }
}


class BadgesRow extends StatelessWidget {
  const BadgesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Badge(
          icon: Icons.visibility_outlined,
          text: '4.569',
          bgColor: const Color(0xFFEEF0FF),
          textColor: const Color(0xFF5B6CFF),
        ),
        const SizedBox(width: 10),
        _Badge(
          icon: Icons.star_border,
          text: '4.9',
          bgColor: const Color(0xFFEEF0FF),
          textColor: const Color(0xFF5B6CFF),
        ),
        const SizedBox(width: 10),
        _Badge(
          icon: null,
          text: 'Best Seller',
          bgColor: const Color(0xFF5B6CFF),
          textColor: Colors.white,
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color bgColor;
  final Color textColor;

  const _Badge({
    this.icon,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: textColor),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}


class LessonCard extends StatelessWidget {
  final String title;
  final String duration;

  const LessonCard({
    super.key,
    required this.title,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
         
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/lesson_thumb.png', 
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),

          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
              ],
            ),
          ),

          
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF5B6CFF), width: 2),
            ),
            child: const Icon(
              Icons.check,
              size: 18,
              color: Color(0xFF5B6CFF),
            ),
          ),
        ],
      ),
    );
  }
}