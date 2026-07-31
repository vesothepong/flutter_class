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
      title: 'Drawer Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const DrawerScreen(),
    );
  }
}

/// Screen សម្រាប់បង្ហាញ Drawer
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  /// រក្សាទុកចំណងជើងទំព័រដែលបានជ្រើសរើស
  String _pageTitle = 'ទំព័រដើម';

  /// Function សម្រាប់ជ្រើសរើស Menu
  void _selectMenu(String title) {
    /// បិទ Drawer
    Navigator.pop(context);

    /// ប្ដូរចំណងជើង
    setState(() {
      _pageTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar នឹងបង្កើត Menu Icon ដោយស្វ័យប្រវត្តិ
      /// ព្រោះ Scaffold មាន drawer
      appBar: AppBar(
        title: Text(_pageTitle),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      /// Drawer Menu
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            /// ផ្នែកក្បាល Drawer
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.teal,
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
              onTap: () {
                _selectMenu('ទំព័រដើម');
              },
            ),

            /// Course Menu
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('មេរៀន'),
              onTap: () {
                _selectMenu('មេរៀន');
              },
            ),

            /// Student Menu
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('និស្សិត'),
              onTap: () {
                _selectMenu('និស្សិត');
              },
            ),

            /// Divider បំបែក Menu
            const Divider(),

            /// Settings Menu
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('ការកំណត់'),
              onTap: () {
                _selectMenu('ការកំណត់');
              },
            ),

            /// About Menu
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('អំពីកម្មវិធី'),
              onTap: () {
                Navigator.pop(context);

                showAboutDialog(
                  context: context,
                  applicationName: 'Drawer Project',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(
                    Icons.flutter_dash,
                    size: 50,
                    color: Colors.teal,
                  ),
                  children: const [
                    Text(
                      'Project នេះសម្រាប់សិក្សាអំពី Drawer Widget។',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu_open,
              size: 100,
              color: Colors.teal,
            ),
            const SizedBox(height: 20),
            Text(
              _pageTitle,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'ចុច Menu Icon ខាងឆ្វេងលើ ដើម្បីបើក Drawer',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
