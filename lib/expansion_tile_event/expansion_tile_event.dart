import 'package:flutter/material.dart';

void main() {
  runApp(const ExpansionTileEventApp());
}

class ExpansionTileEventApp extends StatelessWidget {
  const ExpansionTileEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ExpansionTile Event Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      home: const ExpansionTileEventScreen(),
    );
  }
}

class ExpansionTileEventScreen extends StatefulWidget {
  const ExpansionTileEventScreen({super.key});

  @override
  State<ExpansionTileEventScreen> createState() =>
      _ExpansionTileEventScreenState();
}

class _ExpansionTileEventScreenState extends State<ExpansionTileEventScreen> {
  String eventMessage = 'សូមចុចលើ Course ណាមួយ';
  int expandedCourse = 0;

  void handleExpansion({
    required String courseName,
    required bool isExpanded,
  }) {
    setState(() {
      eventMessage =
          isExpanded ? '$courseName ត្រូវបានបើក' : '$courseName ត្រូវបានបិទ';

      if (isExpanded) {
        expandedCourse++;
      } else if (expandedCourse > 0) {
        expandedCourse--;
      }
    });
  }

  Widget buildLessonTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.play_circle),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title ត្រូវបានជ្រើស'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionTile Events'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.orange.shade100,
            child: Column(
              children: [
                Text(
                  eventMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Expanded Courses: $expandedCourse',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Card(
                  child: ExpansionTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.flutter_dash,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text(
                      'Flutter Programming',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('4 Lessons'),
                    onExpansionChanged: (isExpanded) {
                      handleExpansion(
                        courseName: 'Flutter Programming',
                        isExpanded: isExpanded,
                      );
                    },
                    children: [
                      buildLessonTile(
                        icon: Icons.looks_one,
                        title: 'Lesson 1: Flutter Introduction',
                        subtitle: 'សេចក្ដីផ្ដើមអំពី Flutter',
                      ),
                      buildLessonTile(
                        icon: Icons.looks_two,
                        title: 'Lesson 2: Widget',
                        subtitle: 'រៀនអំពី StatelessWidget',
                      ),
                      buildLessonTile(
                        icon: Icons.looks_3,
                        title: 'Lesson 3: Layout',
                        subtitle: 'Row, Column និង Container',
                      ),
                      buildLessonTile(
                        icon: Icons.looks_4,
                        title: 'Lesson 4: Events',
                        subtitle: 'onPressed, onTap និង onChanged',
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.coffee,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text(
                      'Java Programming',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('3 Lessons'),
                    onExpansionChanged: (isExpanded) {
                      handleExpansion(
                        courseName: 'Java Programming',
                        isExpanded: isExpanded,
                      );
                    },
                    children: [
                      buildLessonTile(
                        icon: Icons.code,
                        title: 'Lesson 1: Java Syntax',
                        subtitle: 'រៀន Syntax មូលដ្ឋាន',
                      ),
                      buildLessonTile(
                        icon: Icons.data_object,
                        title: 'Lesson 2: Variables',
                        subtitle: 'Variables និង Data Types',
                      ),
                      buildLessonTile(
                        icon: Icons.account_tree,
                        title: 'Lesson 3: OOP',
                        subtitle: 'Class និង Object',
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.terminal,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text(
                      'Python Programming',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('3 Lessons'),
                    onExpansionChanged: (isExpanded) {
                      handleExpansion(
                        courseName: 'Python Programming',
                        isExpanded: isExpanded,
                      );
                    },
                    children: [
                      buildLessonTile(
                        icon: Icons.play_arrow,
                        title: 'Lesson 1: Python Introduction',
                        subtitle: 'សេចក្ដីផ្ដើមអំពី Python',
                      ),
                      buildLessonTile(
                        icon: Icons.list,
                        title: 'Lesson 2: List',
                        subtitle: 'រៀនប្រើ Python List',
                      ),
                      buildLessonTile(
                        icon: Icons.functions,
                        title: 'Lesson 3: Function',
                        subtitle: 'បង្កើត និងប្រើ Function',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
