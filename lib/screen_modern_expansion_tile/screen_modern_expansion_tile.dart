

import 'package:flutter/material.dart';

void main() {
  runApp(const ModernExpansionTileApp());
}

class ModernExpansionTileApp extends StatelessWidget {
  const ModernExpansionTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern ExpansionTile',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        fontFamily: 'Arial',
      ),
      home: const ModernExpansionTileScreen(),
    );
  }
}

class ModernExpansionTileScreen extends StatefulWidget {
  const ModernExpansionTileScreen({super.key});

  @override
  State<ModernExpansionTileScreen> createState() =>
      _ModernExpansionTileScreenState();
}

class _ModernExpansionTileScreenState
    extends State<ModernExpansionTileScreen> {
  String eventMessage = 'សូមជ្រើសរើស Course';
  int expandedCourse = 0;

  void handleExpansion({
    required String courseName,
    required bool isExpanded,
  }) {
    setState(() {
      if (isExpanded) {
        eventMessage = '$courseName ត្រូវបានបើក';
        expandedCourse++;
      } else {
        eventMessage = '$courseName ត្រូវបានបិទ';

        if (expandedCourse > 0) {
          expandedCourse--;
        }
      }
    });
  }

  void selectLesson(String lessonName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$lessonName ត្រូវបានជ្រើសរើស'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget buildLessonTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
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
        subtitle: Text(subtitle),
        trailing: Icon(
          Icons.play_circle_fill,
          color: color,
          size: 30,
        ),
        onTap: () {
          selectLesson(title);
        },
      ),
    );
  }

  Widget buildCourseCard({
    required String courseName,
    required String lessonCount,
    required IconData icon,
    required Color color,
    required List<Widget> lessons,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: ExpansionTile(
          shape: const Border(),
          collapsedShape: const Border(),
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          childrenPadding: const EdgeInsets.only(bottom: 15),
          leading: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color,
                  color.withValues(alpha: 0.65),
                ],
              ),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Icon(
              icon,
              color: Colors.white,
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
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              lessonCount,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),
          iconColor: color,
          collapsedIconColor: Colors.grey,
          onExpansionChanged: (isExpanded) {
            handleExpansion(
              courseName: courseName,
              isExpanded: isExpanded,
            );
          },
          children: lessons,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f3fa),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff6a11cb),
                    Color(0xff2575fc),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Online Learning',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'ជ្រើសរើសមេរៀនរបស់អ្នក',
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white30,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          eventMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Expanded Courses: $expandedCourse',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text(
                    'Available Courses',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  buildCourseCard(
                    courseName: 'Flutter Programming',
                    lessonCount: '4 Lessons',
                    icon: Icons.flutter_dash,
                    color: Colors.blue,
                    lessons: [
                      buildLessonTile(
                        icon: Icons.looks_one,
                        title: 'Lesson 1: Introduction',
                        subtitle: 'សេចក្ដីផ្ដើមអំពី Flutter',
                        color: Colors.blue,
                      ),
                      buildLessonTile(
                        icon: Icons.looks_two,
                        title: 'Lesson 2: Widget',
                        subtitle: 'StatelessWidget និង StatefulWidget',
                        color: Colors.blue,
                      ),
                      buildLessonTile(
                        icon: Icons.looks_3,
                        title: 'Lesson 3: Layout',
                        subtitle: 'Row, Column និង Container',
                        color: Colors.blue,
                      ),
                      buildLessonTile(
                        icon: Icons.looks_4,
                        title: 'Lesson 4: Events',
                        subtitle: 'onPressed, onTap និង onChanged',
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  buildCourseCard(
                    courseName: 'Java Programming',
                    lessonCount: '3 Lessons',
                    icon: Icons.coffee,
                    color: Colors.deepOrange,
                    lessons: [
                      buildLessonTile(
                        icon: Icons.code,
                        title: 'Lesson 1: Java Syntax',
                        subtitle: 'សិក្សា Java Syntax មូលដ្ឋាន',
                        color: Colors.deepOrange,
                      ),
                      buildLessonTile(
                        icon: Icons.data_object,
                        title: 'Lesson 2: Variables',
                        subtitle: 'Variables និង Data Types',
                        color: Colors.deepOrange,
                      ),
                      buildLessonTile(
                        icon: Icons.account_tree,
                        title: 'Lesson 3: OOP',
                        subtitle: 'Class, Object និង Method',
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  buildCourseCard(
                    courseName: 'Python Programming',
                    lessonCount: '3 Lessons',
                    icon: Icons.terminal,
                    color: Colors.green,
                    lessons: [
                      buildLessonTile(
                        icon: Icons.play_arrow,
                        title: 'Lesson 1: Python Introduction',
                        subtitle: 'សេចក្ដីផ្ដើមអំពី Python',
                        color: Colors.green,
                      ),
                      buildLessonTile(
                        icon: Icons.list,
                        title: 'Lesson 2: Python List',
                        subtitle: 'ការប្រើប្រាស់ List',
                        color: Colors.green,
                      ),
                      buildLessonTile(
                        icon: Icons.functions,
                        title: 'Lesson 3: Function',
                        subtitle: 'បង្កើត និងប្រើ Function',
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}