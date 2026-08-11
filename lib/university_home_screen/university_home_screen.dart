
import 'package:flutter/material.dart';

void main() {
  runApp(const UniversityHomeApp());
}

class UniversityHomeApp extends StatelessWidget {
  const UniversityHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University Home Screen',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const UniversityHomeScreen(),
    );
  }
}

class UniversityHomeScreen extends StatefulWidget {
  const UniversityHomeScreen({super.key});

  @override
  State<UniversityHomeScreen> createState() => _UniversityHomeScreenState();
}

class _UniversityHomeScreenState extends State<UniversityHomeScreen> {
  int selectedIndex = 0;

  // =========================================================
  // Menu Names
  // =========================================================

  final List<String> menuNames = [
    'ព័ត៌មាន',
    'កម្មវិធីសិក្សា',
    'កាលវិភាគ',
    'លទ្ធផលសិក្សា',
    'បណ្ណាល័យ',
    'សេចក្ដីជូនដំណឹង',
    'បង់ថ្លៃសិក្សា',
    'ទំនាក់ទំនង',
  ];

  // =========================================================
  // Menu Icons
  // =========================================================

  final List<IconData> menuIcons = [
    Icons.newspaper,
    Icons.school,
    Icons.calendar_month,
    Icons.bar_chart,
    Icons.local_library,
    Icons.notifications,
    Icons.payments,
    Icons.contact_support,
  ];

  // =========================================================
  // Menu Colors
  // =========================================================

  final List<Color> menuColors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.brown,
    Colors.red,
    Colors.teal,
    Colors.indigo,
  ];

  // =========================================================
  // Select Menu Event
  // =========================================================

  void selectMenu(String menuName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$menuName ត្រូវបានជ្រើសរើស'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // =========================================================
  // Menu Card
  // =========================================================

  Widget buildMenuCard({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),

      onTap: () {
        selectMenu(title);
      },

      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(22),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // Icon Box
            Container(
              width: 52,
              height: 52,

              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),

                borderRadius: BorderRadius.circular(16),
              ),

              child: Icon(icon, color: color, size: 28),
            ),

            const SizedBox(height: 8),

            // Menu Name
            Flexible(
              child: Text(
                title,

                textAlign: TextAlign.center,

                maxLines: 2,

                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // Announcement Card
  // =========================================================

  Widget buildAnnouncement({
    required String title,
    required String date,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          // Icon
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.12),

            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 13),

          // Announcement Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                Text(
                  date,

                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios, size: 17),
        ],
      ),
    );
  }

  // =========================================================
  // Build
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),

      // =====================================================
      // Body
      // =====================================================
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 25),

          children: [
            // =================================================
            // Header
            // =================================================
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff283c86), Color(0xff45a247)],

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
                  // ===========================================
                  // User Information
                  // ===========================================
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      SizedBox(width: 13),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'សួស្តី!',

                              style: TextStyle(color: Colors.white70),
                            ),

                            Text(
                              'Keo Tongheng',

                              style: TextStyle(
                                color: Colors.white,

                                fontSize: 22,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Badge(
                        label: Text('3'),

                        child: Icon(
                          Icons.notifications_none,

                          color: Colors.white,

                          size: 29,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // ===========================================
                  // Study Information
                  // ===========================================
                  Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.17),

                      borderRadius: BorderRadius.circular(22),

                      border: Border.all(color: Colors.white30),
                    ),

                    child: const Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                'Computer Science',

                                style: TextStyle(
                                  color: Colors.white,

                                  fontSize: 21,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 6),

                              Text(
                                'Year 2 • Semester 1',

                                style: TextStyle(color: Colors.white70),
                              ),

                              SizedBox(height: 12),

                              LinearProgressIndicator(
                                value: 0.72,

                                minHeight: 8,

                                color: Colors.white,

                                backgroundColor: Colors.white24,
                              ),

                              SizedBox(height: 7),

                              Text(
                                'Study Progress: 72%',

                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 15),

                        Icon(Icons.auto_stories, color: Colors.white, size: 65),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // =================================================
            // University Services Title
            // =================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const Text(
                    'University Services',

                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  TextButton(onPressed: () {}, child: const Text('View All')),
                ],
              ),
            ),

            // =================================================
            // Responsive Menu Grid
            // =================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: LayoutBuilder(
                builder: (context, constraints) {
                  // -----------------------------------------
                  // Responsive Column
                  // -----------------------------------------

                  int columnCount = 2;

                  if (constraints.maxWidth >= 900) {
                    columnCount = 4;
                  } else if (constraints.maxWidth >= 600) {
                    columnCount = 3;
                  } else {
                    columnCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: menuNames.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columnCount,

                      crossAxisSpacing: 12,

                      mainAxisSpacing: 12,

                      childAspectRatio: 1.15,
                    ),

                    itemBuilder: (context, index) {
                      return buildMenuCard(
                        title: menuNames[index],

                        icon: menuIcons[index],

                        color: menuColors[index],
                      );
                    },
                  );
                },
              ),
            ),

            // =================================================
            // Announcement Title
            // =================================================
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 28, 20, 15),

              child: Text(
                'សេចក្ដីជូនដំណឹងថ្មីៗ',

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            // =================================================
            // Announcement List
            // =================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                children: [
                  // Announcement 1
                  buildAnnouncement(
                    title: 'ការចុះឈ្មោះសម្រាប់ឆមាសថ្មី',

                    date: 'ថ្ងៃទី ២ ខែសីហា ឆ្នាំ ២០២៦',

                    icon: Icons.app_registration,

                    color: Colors.blue,
                  ),

                  // Announcement 2
                  buildAnnouncement(
                    title: 'កាលវិភាគប្រឡងចុងឆមាស',

                    date: 'ថ្ងៃទី ១០ ខែសីហា ឆ្នាំ ២០២៦',

                    icon: Icons.quiz,

                    color: Colors.orange,
                  ),

                  // Announcement 3
                  buildAnnouncement(
                    title: 'កម្មវិធីសិក្ខាសាលា Flutter',

                    date: 'ថ្ងៃទី ១៥ ខែសីហា ឆ្នាំ ២០២៦',

                    icon: Icons.flutter_dash,

                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // =====================================================
      // Bottom Navigation Bar
      // =====================================================
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [
          // Home
          NavigationDestination(
            icon: Icon(Icons.home_outlined),

            selectedIcon: Icon(Icons.home),

            label: 'Home',
          ),

          // Courses
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),

            selectedIcon: Icon(Icons.menu_book),

            label: 'Courses',
          ),

          // Schedule
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),

            selectedIcon: Icon(Icons.calendar_month),

            label: 'Schedule',
          ),

          // Profile
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
