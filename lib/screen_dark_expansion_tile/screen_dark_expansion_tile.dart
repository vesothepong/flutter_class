

import 'package:flutter/material.dart';

void main() {
  runApp(const DarkExpansionTileApp());
}

class DarkExpansionTileApp extends StatelessWidget {
  const DarkExpansionTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dark ExpansionTile',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.cyan,
        scaffoldBackgroundColor: const Color(0xff0d1117),
      ),
      home: const DarkExpansionTileScreen(),
    );
  }
}

class DarkExpansionTileScreen extends StatefulWidget {
  const DarkExpansionTileScreen({super.key});

  @override
  State<DarkExpansionTileScreen> createState() =>
      _DarkExpansionTileScreenState();
}

class _DarkExpansionTileScreenState
    extends State<DarkExpansionTileScreen> {
  String statusMessage = 'Ready to learn';
  int expandedCount = 0;

  void handleExpansion({
    required String courseName,
    required bool isExpanded,
  }) {
    setState(() {
      if (isExpanded) {
        statusMessage = 'Opened: $courseName';
        expandedCount++;
      } else {
        statusMessage = 'Closed: $courseName';

        if (expandedCount > 0) {
          expandedCount--;
        }
      }
    });
  }

  Widget buildLesson({
    required IconData icon,
    required String title,
    required String level,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      decoration: BoxDecoration(
        color: const Color(0xff161b22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: ListTile(
        leading: Container(
          width: 43,
          height: 43,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(level),
        trailing: Icon(
          Icons.play_circle_fill,
          color: color,
          size: 30,
        ),
        onTap: () {
          setState(() {
            statusMessage = 'Selected: $title';
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title selected'),
              backgroundColor: const Color(0xff21262d),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      ),
    );
  }

  Widget buildCourse({
    required IconData icon,
    required String courseName,
    required String description,
    required String lessonCount,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xff161b22),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: ExpansionTile(
        shape: const Border(),
        collapsedShape: const Border(),
        tilePadding: const EdgeInsets.all(18),
        childrenPadding: const EdgeInsets.only(bottom: 15),
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withValues(alpha: 0.35),
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
        title: Text(
          courseName,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  lessonCount,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        iconColor: color,
        collapsedIconColor: Colors.white54,
        onExpansionChanged: (isExpanded) {
          handleExpansion(
            courseName: courseName,
            isExpanded: isExpanded,
          );
        },
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0d1117),
        title: const Text(
          'Developer Courses',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff004e92),
                  Color(0xff000428),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.cyan.withValues(alpha: 0.25),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.cyan.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.code,
                    color: Colors.cyanAccent,
                    size: 38,
                  ),
                ),
                const SizedBox(width: 17),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Learning Status',
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        statusMessage,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Opened Courses: $expandedCount',
                        style: const TextStyle(
                          color: Colors.cyanAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Courses',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                  color: Colors.cyanAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          buildCourse(
            icon: Icons.flutter_dash,
            courseName: 'Flutter Developer',
            description: 'Build Mobile Applications',
            lessonCount: '4 Lessons',
            color: Colors.lightBlueAccent,
            children: [
              buildLesson(
                icon: Icons.start,
                title: 'Flutter Introduction',
                level: 'Beginner',
                color: Colors.lightBlueAccent,
              ),
              buildLesson(
                icon: Icons.widgets,
                title: 'Flutter Widgets',
                level: 'Beginner',
                color: Colors.lightBlueAccent,
              ),
              buildLesson(
                icon: Icons.view_quilt,
                title: 'Flutter Layout',
                level: 'Intermediate',
                color: Colors.lightBlueAccent,
              ),
              buildLesson(
                icon: Icons.touch_app,
                title: 'Flutter Events',
                level: 'Intermediate',
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
          buildCourse(
            icon: Icons.javascript,
            courseName: 'JavaScript Developer',
            description: 'Build Interactive Websites',
            lessonCount: '3 Lessons',
            color: Colors.amber,
            children: [
              buildLesson(
                icon: Icons.code,
                title: 'JavaScript Syntax',
                level: 'Beginner',
                color: Colors.amber,
              ),
              buildLesson(
                icon: Icons.data_object,
                title: 'Variables and Data Types',
                level: 'Beginner',
                color: Colors.amber,
              ),
              buildLesson(
                icon: Icons.functions,
                title: 'JavaScript Functions',
                level: 'Intermediate',
                color: Colors.amber,
              ),
            ],
          ),
          buildCourse(
            icon: Icons.storage,
            courseName: 'Database Development',
            description: 'Learn MySQL Database',
            lessonCount: '3 Lessons',
            color: Colors.greenAccent,
            children: [
              buildLesson(
                icon: Icons.table_chart,
                title: 'Database Introduction',
                level: 'Beginner',
                color: Colors.greenAccent,
              ),
              buildLesson(
                icon: Icons.add_box,
                title: 'Create Database and Table',
                level: 'Beginner',
                color: Colors.greenAccent,
              ),
              buildLesson(
                icon: Icons.edit_document,
                title: 'CRUD Operations',
                level: 'Intermediate',
                color: Colors.greenAccent,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xff161b22),
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(		
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorite',
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