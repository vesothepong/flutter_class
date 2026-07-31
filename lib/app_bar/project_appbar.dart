
import 'package:flutter/material.dart';
import 'package:flutter_learning/main.dart';

void main() {
  runApp(const Home());
}

/// Root Widget
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppBar Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const AppBarScreen(),
    );
  }
}

/// Screen សម្រាប់បង្ហាញ AppBar
class AppBarScreen extends StatelessWidget {
  const AppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar បង្ហាញនៅផ្នែកខាងលើ
      appBar: AppBar(
        /// ចំណងជើង AppBar
        title: const Text('AppBar Project'),

        /// ដាក់ចំណងជើងនៅកណ្ដាល
        centerTitle: true,

        /// ពណ៌ផ្ទៃ AppBar
        backgroundColor: Colors.blue,

        /// ពណ៌អក្សរ និង Icon
        foregroundColor: Colors.white,

        /// Icon នៅខាងឆ្វេង
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('អ្នកបានចុច Menu'),
              ),
            );
          },
        ),

        /// Icon នៅខាងស្តាំ
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'ស្វែងរក',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('អ្នកបានចុច Search'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'ការជូនដំណឹង',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('មិនមានការជូនដំណឹងថ្មីទេ'),
                ),
              );
            },
          ),
        ],
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.web_asset,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'សិក្សាអំពី AppBar Widget',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'AppBar បង្ហាញចំណងជើង និង Action Icons',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}



