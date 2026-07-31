

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root Widget របស់កម្មវិធី
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// លាក់ Debug Banner
      debugShowCheckedModeBanner: false,

      /// ឈ្មោះកម្មវិធី
      title: 'Navigation Widgets Project',

      /// Theme របស់កម្មវិធី
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),

      /// Screen ដំបូង
      home: const MainScreen(),
    );
  }
}

/// MainScreen ប្រើ StatefulWidget
/// ព្រោះត្រូវផ្លាស់ប្ដូរ Screen និង selectedIndex
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Index របស់ Screen ដែលបានជ្រើសរើស
  int _selectedIndex = 0;

  /// ចំណងជើង AppBar
  final List<String> _pageTitles = [
    'ទំព័រដើម',
    'មេរៀន',
    'ប្រវត្តិរូប',
  ];

  /// បញ្ជី Screen
  final List<Widget> _screens = const [
    HomePage(),
    CoursePage(),
    ProfilePage(),
  ];

  /// Function សម្រាប់ BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Function សម្រាប់ជ្រើសរើស Menu ក្នុង Drawer
  void _selectDrawerMenu(int index) {
    /// បិទ Drawer
    Navigator.pop(context);

    /// ប្ដូរ Screen
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Function សម្រាប់បង្ហាញ SnackBar
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // AppBar
      
      appBar: AppBar(
        /// ចំណងជើងផ្លាស់ប្ដូរតាម Screen
        title: Text(_pageTitles[_selectedIndex]),

        /// ដាក់ចំណងជើងនៅកណ្ដាល
        centerTitle: true,

        /// ពណ៌ផ្ទៃ AppBar
        backgroundColor: Colors.deepPurple,

        /// ពណ៌អក្សរ និង Icon
        foregroundColor: Colors.white,

        /// Icon នៅខាងស្ដាំ
        actions: [
          /// Search Icon
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'ស្វែងរក',
            onPressed: () {
              _showMessage('អ្នកបានចុច Search');
            },
          ),

          /// Notification Icon
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'ការជូនដំណឹង',
            onPressed: () {
              _showMessage('មិនមានការជូនដំណឹងថ្មីទេ');
            },
          ),
        ],
      ),

      
      // Drawer
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            /// ផ្នែកក្បាល Drawer
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.deepPurple,
                ),
              ),
              accountName: Text(
                'Keo Tongheng',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text('teacher@example.com'),
            ),

            /// Home Menu
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('ទំព័រដើម'),

              /// បង្ហាញពណ៌នៅពេល Menu ត្រូវបានជ្រើសរើស
              selected: _selectedIndex == 0,
              selectedColor: Colors.deepPurple,

              onTap: () {
                _selectDrawerMenu(0);
              },
            ),

            /// Course Menu
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('មេរៀន'),
              selected: _selectedIndex == 1,
              selectedColor: Colors.deepPurple,
              onTap: () {
                _selectDrawerMenu(1);
              },
            ),

            /// Profile Menu
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('ប្រវត្តិរូប'),
              selected: _selectedIndex == 2,
              selectedColor: Colors.deepPurple,
              onTap: () {
                _selectDrawerMenu(2);
              },
            ),

            /// បន្ទាត់បំបែក
            const Divider(),

            /// Settings Menu
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('ការកំណត់'),
              onTap: () {
                Navigator.pop(context);
                _showMessage('អ្នកបានចុចការកំណត់');
              },
            ),

            /// About Menu
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('អំពីកម្មវិធី'),
              onTap: () {
                /// បិទ Drawer
                Navigator.pop(context);

                /// បង្ហាញ About Dialog
                showAboutDialog(
                  context: context,
                  applicationName: 'Navigation Widgets Project',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(
                    Icons.flutter_dash,
                    size: 55,
                    color: Colors.deepPurple,
                  ),
                  children: const [
                    Text(
                      'Project នេះបង្កើតឡើងសម្រាប់សិក្សាអំពី '
                      'AppBar, Drawer និង BottomNavigationBar។',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),

      
      // Body
      

      /// បង្ហាញ Screen តាម Index
      body: _screens[_selectedIndex],

      
      // BottomNavigationBar
      
      bottomNavigationBar: BottomNavigationBar(
        /// Index ដែលបានជ្រើសរើស
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

        /// Navigation Items
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

      
      // FloatingActionButton
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMessage('អ្នកបានចុច FloatingActionButton');
        },
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}


// Home Page

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
          SizedBox(height: 10),
          Text(
            'សូមស្វាគមន៍មកកាន់ Flutter Application',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}


// Course Page

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
          SizedBox(height: 10),
          Text(
            'សិក្សាអំពី Flutter Navigation Widgets',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}


// Profile Page

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.deepPurple,
            child: Icon(
              Icons.person,
              size: 75,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Keo Tongheng',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Flutter Teacher',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
