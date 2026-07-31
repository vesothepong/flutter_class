

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const BottomNavigationScreen(),
    );
  }
}

/// Screen ប្រើ StatefulWidget
/// ព្រោះ selectedIndex ត្រូវផ្លាស់ប្ដូរ
class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() =>
      _BottomNavigationScreenState();
}

class _BottomNavigationScreenState
    extends State<BottomNavigationScreen> {
  /// Index ដែលបានជ្រើសរើស
  int _selectedIndex = 0;

  /// List Screens
  final List<Widget> _screens = const [
    HomePage(),
    CoursePage(),
    ProfilePage(),
  ];

  /// Function ពេលចុច BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      /// បង្ហាញ Screen តាម Index
      body: _screens[_selectedIndex],

      /// Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        /// Item ដែលបានជ្រើសរើស
        currentIndex: _selectedIndex,

        /// Function ពេលចុច Item
        onTap: _onItemTapped,

        /// ពណ៌ Item ដែលបានជ្រើសរើស
        selectedItemColor: Colors.deepPurple,

        /// ពណ៌ Item ដែលមិនបានជ្រើសរើស
        unselectedItemColor: Colors.grey,

        /// បង្ហាញ Label
        showSelectedLabels: true,
        showUnselectedLabels: true,

        /// បញ្ជី Navigation Items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'ទំព័រដើម',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'មេរៀន',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'ប្រវត្តិរូប',
          ),
        ],
      ),
    );
  }
}

/// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            size: 100,
            color: Colors.deepPurple,
          ),
          SizedBox(height: 20),
          Text(
            'ទំព័រដើម',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Course Page
class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.book,
            size: 100,
            color: Colors.deepPurple,
          ),
          SizedBox(height: 20),
          Text(
            'ទំព័រមេរៀន',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.deepPurple,
            child: Icon(
              Icons.person,
              size: 70,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'ទំព័រប្រវត្តិរូប',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}



