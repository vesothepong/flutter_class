
import 'package:flutter/material.dart';

void main() {
  runApp(const DrawerEventApp());
}

class DrawerEventApp extends StatelessWidget {
  const DrawerEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer Event Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const DrawerEventScreen(),
    );
  }
}

class DrawerEventScreen extends StatefulWidget {
  const DrawerEventScreen({super.key});

  @override
  State<DrawerEventScreen> createState() =>
      _DrawerEventScreenState();
}

class _DrawerEventScreenState
    extends State<DrawerEventScreen> {
  String drawerStatus = 'Drawer មិនទាន់បានបើក';
  String selectedMenu = 'Home';
  IconData selectedIcon = Icons.home;
  Color selectedColor = Colors.blue;

  void selectMenu({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    setState(() {
      selectedMenu = title;
      selectedIcon = icon;
      selectedColor = color;
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title ត្រូវបានជ្រើស'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: (isOpened) {
        setState(() {
          drawerStatus = isOpened
              ? 'Drawer ត្រូវបានបើក'
              : 'Drawer ត្រូវបានបិទ';
        });

        debugPrint(drawerStatus);
      },
      appBar: AppBar(
        title: Text(selectedMenu),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                color: Colors.teal,
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Sok Dara',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'sokdara@example.com',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                title: const Text('Home'),
                onTap: () {
                  selectMenu(
                    title: 'Home',
                    icon: Icons.home,
                    color: Colors.blue,
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.people,
                  color: Colors.green,
                ),
                title: const Text('Students'),
                onTap: () {
                  selectMenu(
                    title: 'Students',
                    icon: Icons.people,
                    color: Colors.green,
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.menu_book,
                  color: Colors.orange,
                ),
                title: const Text('Courses'),
                onTap: () {
                  selectMenu(
                    title: 'Courses',
                    icon: Icons.menu_book,
                    color: Colors.orange,
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.purple,
                ),
                title: const Text('Settings'),
                onTap: () {
                  selectMenu(
                    title: 'Settings',
                    icon: Icons.settings,
                    color: Colors.purple,
                  );
                },
              ),
              const Spacer(),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logout ត្រូវបានចុច'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(30),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  selectedIcon,
                  size: 110,
                  color: selectedColor,
                ),
                const SizedBox(height: 20),
                Text(
                  selectedMenu,
                  style: TextStyle(
                    fontSize: 32,
                    color: selectedColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  drawerStatus,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'ចុច Menu Icon នៅ AppBar ដើម្បីបើក Drawer',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


