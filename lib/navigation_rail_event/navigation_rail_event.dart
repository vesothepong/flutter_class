

import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationRailEventApp());
}

class NavigationRailEventApp extends StatelessWidget {
  const NavigationRailEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Rail Event',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const NavigationRailScreen(),
    );
  }
}
class NavigationRailScreen extends StatefulWidget {
  const NavigationRailScreen({super.key});

  @override
  State<NavigationRailScreen> createState() =>
      _NavigationRailScreenState();
}

class _NavigationRailScreenState
    extends State<NavigationRailScreen> {
  int selectedIndex = 0;
  bool extended = true;

  final List<NavigationPageData> pages = const [
    NavigationPageData(
      title: 'Dashboard',
      description: 'បង្ហាញព័ត៌មានសង្ខេបរបស់ប្រព័ន្ធ',
      icon: Icons.dashboard,
      color: Colors.blue,
    ),
    NavigationPageData(
      title: 'Students',
      description: 'គ្រប់គ្រងព័ត៌មាននិស្សិត',
      icon: Icons.people,
      color: Colors.green,
    ),
    NavigationPageData(
      title: 'Courses',
      description: 'គ្រប់គ្រងមុខវិជ្ជា',
      icon: Icons.menu_book,
      color: Colors.orange,
    ),
    NavigationPageData(
      title: 'Settings',
      description: 'ការកំណត់ប្រព័ន្ធ',
      icon: Icons.settings,
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final NavigationPageData selectedPage =
        pages[selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationRail Event'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                extended = !extended;
              });
            },
            tooltip: 'Expand or Collapse',
            icon: Icon(
              extended
                  ? Icons.chevron_left
                  : Icons.chevron_right,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            extended: extended,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });

              debugPrint(
                'Selected Destination: ${pages[index].title}',
              );
            },
            leading: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: FlutterLogo(size: 50),
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people_outline),
                selectedIcon: Icon(Icons.people),
                label: Text('Students'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.menu_book_outlined),
                selectedIcon: Icon(Icons.menu_book),
                label: Text('Courses'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: Container(
              color: selectedPage.color.withValues(alpha: 0.1),
              child: Center(
                child: Card(
                  margin: const EdgeInsets.all(30),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          selectedPage.icon,
                          size: 120,
                          color: selectedPage.color,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          selectedPage.title,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: selectedPage.color,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          selectedPage.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationPageData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const NavigationPageData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

