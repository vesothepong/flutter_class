import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeTextScreen(),
    );
  }
}

class ChangeTextScreen extends StatefulWidget {
  const ChangeTextScreen({super.key});

  @override
  State<ChangeTextScreen> createState() {
    return _ChangeTextScreenState();
  }
}

class _ChangeTextScreenState extends State<ChangeTextScreen> {
  String message = 'Hello Student';

  void changeMessage() {
    setState(() {
      message = 'Welcome to Flutter Class';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Text'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: changeMessage,
              child: const Text('Change Text'),
            ),
          ],
        ),
      ),
    );
  }
}
