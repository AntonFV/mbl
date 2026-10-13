import 'package:flutter/material.dart';

void main() {
  runApp(const MenuApp());
}

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Popular Menu',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      home: const MenuScreen(),
    );
  }
}


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: HeaderBar(),
            ),

            const SizedBox(height: 20),

            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SearchRow(),
            ),

            const SizedBox(height: 15),

            
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  DishCard(
                    image: 'assets/salad_original.png',
                    title: 'Original Salad',
                    restaurant: 'Lovy Food',
                    price: '\$8',
                  ),
                  SizedBox(height: 12),
                  DishCard(
                    image: 'assets/salad_fresh.png',
                    title: 'Fresh Salad',
                    restaurant: 'Cloudy Resto',
                    price: '\$10',
                  ),
                  SizedBox(height: 12),
                  DishCard(
                    image: 'assets/ice_cream.png',
                    title: 'Yummie Ice Cream',
                    restaurant: 'Circlo Resto',
                    price: '\$6',
                  ),
                  SizedBox(height: 12),
                  DishCard(
                    image: 'assets/vegan_special.png',
                    title: 'Vegan Special',
                    restaurant: 'Haty Food',
                    price: '\$11',
                  ),
                  SizedBox(height: 12),
                  DishCard(
                    image: 'assets/mixed_pasta.png',
                    title: 'Mixed Pasta',
                    restaurant: 'Recto Food',
                    price: '\$13',
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),

      
      bottomNavigationBar: const BottomNavBar(),
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
              color: const Color(0xFFFFE5E5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Color(0xFFFF5C5C),
            ),
          ),
        ),
        const SizedBox(width: 15),
        const Text(
          'Popular Menu',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }
}


class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Color(0xFF9E9E9E), size: 22),
                SizedBox(width: 10),
                Text(
                  'Search',
                  style: TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),

        
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE5E5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.tune,
            color: Color(0xFFFF5C5C),
            size: 22,
          ),
        ),
      ],
    );
  }
}


class DishCard extends StatelessWidget {
  final String image;
  final String title;
  final String restaurant;
  final String price;

  const DishCard({
    super.key,
    required this.image,
    required this.title,
    required this.restaurant,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              width: 65,
              height: 65,
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  restaurant,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
              ],
            ),
          ),

          
          Text(
            price,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF5C5C),
            ),
          ),
        ],
      ),
    );
  }
}


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            _NavItem(
              icon: Icons.home,
              label: 'Home',
              active: true,
              onTap: () {},
            ),
            _NavItem(
              icon: Icons.card_giftcard,
              label: '',
              active: false,
              onTap: () {},
            ),
            _NavItem(
              icon: Icons.credit_card,
              label: '',
              active: false,
              onTap: () {},
            ),
            _NavItem(
              icon: Icons.person,
              label: '',
              active: false,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: active ? 18 : 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFFFE5E5) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: active ? const Color(0xFFFF5C5C) : const Color(0xFF9E9E9E),
              size: 24,
            ),
            if (active && label.isNotEmpty) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFFFF5C5C),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}