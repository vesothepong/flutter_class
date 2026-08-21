

import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceHomeApp());
}

class EcommerceHomeApp extends StatelessWidget {
  const EcommerceHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Home Screen',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepOrange,
      ),
      home: const EcommerceHomeScreen(),
    );
  }
}

class EcommerceHomeScreen extends StatefulWidget {
  const EcommerceHomeScreen({super.key});

  @override
  State<EcommerceHomeScreen> createState() =>
      _EcommerceHomeScreenState();
}

class _EcommerceHomeScreenState extends State<EcommerceHomeScreen> {
  int selectedIndex = 0;
  int cartCount = 0;
  int favoriteCount = 0;

  final List<String> categoryNames = [
    'Phones',
    'Laptops',
    'Fashion',
    'Shoes',
    'Home',
    'Books',
  ];

  final List<IconData> categoryIcons = [
    Icons.smartphone,
    Icons.laptop,
    Icons.checkroom,
    Icons.directions_run,
    Icons.chair,
    Icons.menu_book,
  ];

  final List<Color> categoryColors = [
    Colors.blue,
    Colors.indigo,
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.brown,
  ];

  void addToCart(String productName) {
    setState(() {
      cartCount++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$productName បានបញ្ចូលក្នុងកន្ត្រក'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget buildCategory({
    required String name,
    required IconData icon,
    required Color color,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$name Category ត្រូវបានជ្រើសរើស'),
          ),
        );
      },
      child: Container(
        width: 82,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(19),
              ),
              child: Icon(
                icon,
                color: color,
                size: 31,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard({
    required String productName,
    required String price,
    required String oldPrice,
    required String rating,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.10),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(22),
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 72,
                  ),
                ),
                Positioned(
                  top: 9,
                  right: 9,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          favoriteCount++;
                        });
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      '-20%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 13, 13, 5),
            child: Text(
              productName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 17,
                ),
                const SizedBox(width: 4),
                Text(rating),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 6, 8, 11),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          color: color,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Text(
                        oldPrice,
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton.filled(
                  onPressed: () {
                    addToCart(productName);
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff8f5),
      appBar: AppBar(
        backgroundColor: const Color(0xfffff8f5),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Customer!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Find your favorite products',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              label: Text('$favoriteCount'),
              child: const Icon(Icons.favorite_outline),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Badge(
              label: Text('$cartCount'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.tune),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(23),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xffff512f),
                  Color(0xffdd2476),
                ],
              ),
              borderRadius: BorderRadius.circular(26),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mega Sale',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Up to 50% Off',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Shop now and save more.',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                  size: 85,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryNames.length,
              itemBuilder: (context, index) {
                return buildCategory(
                  name: categoryNames[index],
                  icon: categoryIcons[index],
                  color: categoryColors[index],
                );
              },
            ),
          ),
          const SizedBox(height: 25),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See More',
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.68,
            children: [
              buildProductCard(
                productName: 'Smartphone Pro',
                price: '\$499',
                oldPrice: '\$599',
                rating: '4.8',
                icon: Icons.smartphone,
                color: Colors.blue,
              ),
              buildProductCard(
                productName: 'Laptop Air',
                price: '\$799',
                oldPrice: '\$899',
                rating: '4.7',
                icon: Icons.laptop,
                color: Colors.indigo,
              ),
              buildProductCard(
                productName: 'Wireless Headphone',
                price: '\$89',
                oldPrice: '\$120',
                rating: '4.6',
                icon: Icons.headphones,
                color: Colors.purple,
              ),
              buildProductCard(
                productName: 'Smart Watch',
                price: '\$129',
                oldPrice: '\$160',
                rating: '4.5',
                icon: Icons.watch,
                color: Colors.green,
              ),
              buildProductCard(
                productName: 'Fashion Bag',
                price: '\$35',
                oldPrice: '\$45',
                rating: '4.4',
                icon: Icons.shopping_bag,
                color: Colors.pink,
              ),
              buildProductCard(
                productName: 'Sport Shoes',
                price: '\$59',
                oldPrice: '\$75',
                rating: '4.7',
                icon: Icons.directions_run,
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Category',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}