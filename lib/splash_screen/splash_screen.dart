import 'package:flutter/material.dart';

void main() {
  runApp(const AUBApp());
}
 
class AUBApp extends StatelessWidget {
  const AUBApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ACLEDA University of Business',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        fontFamily: 'KhmerMool1', // អាចបន្ថែម font Khmer នៅ pubspec.yaml
      ),
      home: const SplashScreen(),
    );
  }
}

/// ---------------- Splash Screen ----------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 140,
              child: Image.asset(
                'assets/images/LogoAUB.png',
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.school, size: 120, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'សាកលវិទ្យាល័យ ពាណិជ្ជសាស្ត្រ អេស៊ីលីដា',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'ACLEDA UNIVERSITY of Business',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.teal),
          ],
        ),
      ),
    );
  }
}

/// ---------------- Home Screen ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ACLEDA University of Business"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Welcome to ACLEDA University of Business",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
