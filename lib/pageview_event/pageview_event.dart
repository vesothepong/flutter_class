
import 'package:flutter/material.dart';

void main() {
  runApp(const PageViewEventApp());
}

class PageViewEventApp extends StatelessWidget {
  const PageViewEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PageView Event Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      home: const PageViewEventScreen(),
    );
  }
}

class PageViewEventScreen extends StatefulWidget {
  const PageViewEventScreen({super.key});

  @override
  State<PageViewEventScreen> createState() =>
      _PageViewEventScreenState();
}

class _PageViewEventScreenState
    extends State<PageViewEventScreen> {
  final PageController pageController = PageController();

  int currentPage = 0;

  final List<PageData> pages = const [
    PageData(
      title: 'Welcome',
      description: 'សូមស្វាគមន៍មកកាន់ Flutter App',
      icon: Icons.flutter_dash,
      color: Colors.blue,
    ),
    PageData(
      title: 'Learn',
      description: 'រៀនបង្កើត Mobile Application',
      icon: Icons.school,
      color: Colors.green,
    ),
    PageData(
      title: 'Start',
      description: 'ចាប់ផ្ដើមបង្កើត Project របស់អ្នក',
      icon: Icons.rocket_launch,
      color: Colors.orange,
    ),
  ];

  void goToNextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPreviousPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Events'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });

                debugPrint('Current Page: $index');
              },
              itemBuilder: (context, index) {
                final PageData page = pages[index];

                return Container(
                  color: page.color.withValues(alpha: 0.12),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        page.icon,
                        size: 140,
                        color: page.color,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        page.title,
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: page.color,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        page.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          goToPage(index);
                        },
                        child: AnimatedContainer(
                          duration:
                              const Duration(milliseconds: 300),
                          width: currentPage == index ? 35 : 12,
                          height: 12,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? pages[index].color
                                : Colors.grey,
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Page ${currentPage + 1} of ${pages.length}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: currentPage == 0
                            ? null
                            : goToPreviousPage,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Previous'),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed:
                            currentPage == pages.length - 1
                                ? null
                                : goToNextPage,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const PageData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

