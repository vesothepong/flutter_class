
import 'package:flutter/material.dart';

void main() {
  runApp(const ScrollEventApp());
}

class ScrollEventApp extends StatelessWidget {
  const ScrollEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scroll Event Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const ScrollEventScreen(),
    );
  }
}

class ScrollEventScreen extends StatefulWidget {
  const ScrollEventScreen({super.key});

  @override
  State<ScrollEventScreen> createState() =>
      _ScrollEventScreenState();
}

class _ScrollEventScreenState extends State<ScrollEventScreen> {
  final ScrollController scrollController = ScrollController();

  double scrollPosition = 0;
  String scrollStatus = 'Scroll មិនទាន់ចាប់ផ្ដើម';
  bool showScrollTopButton = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {
        scrollPosition = scrollController.position.pixels;

        showScrollTopButton = scrollPosition > 300;

        if (scrollController.position.atEdge) {
          if (scrollPosition == 0) {
            scrollStatus = 'បាន Scroll ដល់ខាងលើ';
          } else {
            scrollStatus = 'បាន Scroll ដល់ខាងក្រោម';
          }
        } else {
          scrollStatus = 'កំពុង Scroll';
        }
      });
    });
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Events'),
        actions: [
          IconButton(
            onPressed: scrollToBottom,
            tooltip: 'Scroll to Bottom',
            icon: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: Colors.green.shade100,
            child: Column(
              children: [
                Text(
                  scrollStatus,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Position: ${scrollPosition.toStringAsFixed(1)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  setState(() {
                    scrollStatus = 'Scroll បានចាប់ផ្ដើម';
                  });
                }

                if (notification is ScrollEndNotification) {
                  setState(() {
                    scrollStatus = 'Scroll បានបញ្ចប់';
                  });
                }

                return false;
              },
              child: ListView.builder(
                controller: scrollController,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 7,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        'Student ${index + 1}',
                      ),
                      subtitle: const Text(
                        'Computer Science Student',
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: showScrollTopButton
          ? FloatingActionButton(
              onPressed: scrollToTop,
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
