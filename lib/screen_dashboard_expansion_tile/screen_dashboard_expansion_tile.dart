

import 'package:flutter/material.dart';

void main() {
  runApp(const DashboardExpansionApp());
}

class DashboardExpansionApp extends StatelessWidget {
  const DashboardExpansionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const DashboardExpansionScreen(),
    );
  }
}

class DashboardExpansionScreen extends StatefulWidget {
  const DashboardExpansionScreen({super.key});

  @override
  State<DashboardExpansionScreen> createState() =>
      _DashboardExpansionScreenState();
}

class _DashboardExpansionScreenState
    extends State<DashboardExpansionScreen> {
  String selectedCourse = 'មិនទាន់មាន Course ត្រូវបានជ្រើស';
  int openedCourses = 0;

  void handleExpansion(
    String courseName,
    bool isExpanded,
  ) {
    setState(() {
      if (isExpanded) {
        selectedCourse = '$courseName កំពុងបើក';
        openedCourses++;
      } else {
        selectedCourse = '$courseName ត្រូវបានបិទ';

        if (openedCourses > 0) {
          openedCourses--;
        }
      }
    });
  }

  void openLesson(String lessonName) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 35,
                child: Icon(
                  Icons.play_arrow,
                  size: 40,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                lessonName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'អ្នកបានជ្រើសរើសមេរៀននេះ',
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.play_circle),
                  label: const Text('ចាប់ផ្ដើមរៀន'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSummaryCard({
    required IconData icon,
    required String number,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 30,
            ),
            const SizedBox(height: 8),
            Text(
              number,
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLesson({
    required int lessonNumber,
    required String title,
    required String duration,
    required bool completed,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 4,
      ),
      leading: CircleAvatar(
        backgroundColor: completed
            ? Colors.green.withValues(alpha: 0.15)
            : Colors.indigo.withValues(alpha: 0.12),
        child: completed
            ? const Icon(
                Icons.check,
                color: Colors.green,
              )
            : Text(
                '$lessonNumber',
                style: const TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.schedule,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(duration),
        ],
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
      onTap: () {
        openLesson(title);
      },
    );
  }

  Widget buildCourse({
    required String title,
    required String teacher,
    required String progressText,
    required double progress,
    required IconData icon,
    required Color color,
    required List<Widget> lessons,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      child: ExpansionTile(
        shape: const Border(),
        collapsedShape: const Border(),
        tilePadding: const EdgeInsets.all(18),
        childrenPadding: const EdgeInsets.only(bottom: 15),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text('Teacher: $teacher'),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 7,
                    borderRadius: BorderRadius.circular(10),
                    color: color,
                    backgroundColor: color.withValues(alpha: 0.15),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  progressText,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        onExpansionChanged: (isExpanded) {
          handleExpansion(
            title,
            isExpanded,
          );
        },
        children: lessons,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f8fc),
      appBar: AppBar(
        backgroundColor: const Color(0xfff7f8fc),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Learning',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Course Dashboard',
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
            icon: const Badge(
              label: Text('3'),
              child: Icon(Icons.notifications_outlined),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'បន្តការសិក្សារបស់អ្នក',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'You completed 65% of your courses.',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.auto_stories,
                  color: Colors.white,
                  size: 80,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              buildSummaryCard(
                icon: Icons.menu_book,
                number: '3',
                label: 'Courses',
                color: Colors.indigo,
              ),
              const SizedBox(width: 12),
              buildSummaryCard(
                icon: Icons.play_lesson,
                number: '10',
                label: 'Lessons',
                color: Colors.orange,
              ),
              const SizedBox(width: 12),
              buildSummaryCard(
                icon: Icons.check_circle,
                number: '6',
                label: 'Completed',
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.touch_app),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Text(
                    selectedCourse,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$openedCourses Open',
                    style: const TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'My Courses',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          buildCourse(
            title: 'Flutter Development',
            teacher: 'Keo Tongheng',
            progressText: '75%',
            progress: 0.75,
            icon: Icons.flutter_dash,
            color: Colors.blue,
            lessons: [
              buildLesson(
                lessonNumber: 1,
                title: 'Flutter Introduction',
                duration: '15 minutes',
                completed: true,
              ),
              buildLesson(
                lessonNumber: 2,
                title: 'StatelessWidget',
                duration: '20 minutes',
                completed: true,
              ),
              buildLesson(
                lessonNumber: 3,
                title: 'StatefulWidget',
                duration: '25 minutes',
                completed: false,
              ),
              buildLesson(
                lessonNumber: 4,
                title: 'Flutter Events',
                duration: '30 minutes',
                completed: false,
              ),
            ],
          ),
          buildCourse(
            title: 'Java Programming',
            teacher: 'Mr. Teacher',
            progressText: '50%',
            progress: 0.50,
            icon: Icons.coffee,
            color: Colors.orange,
            lessons: [
              buildLesson(
                lessonNumber: 1,
                title: 'Java Syntax',
                duration: '20 minutes',
                completed: true,
              ),
              buildLesson(
                lessonNumber: 2,
                title: 'Variables and Data Types',
                duration: '25 minutes',
                completed: true,
              ),
              buildLesson(
                lessonNumber: 3,
                title: 'Object-Oriented Programming',
                duration: '35 minutes',
                completed: false,
              ),
            ],
          ),
          buildCourse(
            title: 'Python Programming',
            teacher: 'Ms. Instructor',
            progressText: '40%',
            progress: 0.40,
            icon: Icons.terminal,
            color: Colors.green,
            lessons: [
              buildLesson(
                lessonNumber: 1,
                title: 'Python Introduction',
                duration: '15 minutes',
                completed: true,
              ),
              buildLesson(
                lessonNumber: 2,
                title: 'Python List',
                duration: '25 minutes',
                completed: false,
              ),
              buildLesson(
                lessonNumber: 3,
                title: 'Python Function',
                duration: '30 minutes',
                completed: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}