import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonEventApp());
}

class ButtonEventApp extends StatelessWidget {
  const ButtonEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Button Event Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const ButtonEventScreen(),
    );
  }
}

class ButtonEventScreen extends StatefulWidget {
  const ButtonEventScreen({super.key});

  @override
  State<ButtonEventScreen> createState() => _ButtonEventScreenState();
}

class _ButtonEventScreenState extends State<ButtonEventScreen> {
  String message = 'សូមចុច Button ណាមួយ';
  int counter = 0;

  void showMessage(String newMessage) {
    setState(() {
      message = newMessage;
    });
  }

  void increaseCounter() {
    setState(() {
      counter++;
      message = 'Counter ត្រូវបានបន្ថែម';
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
      message = 'Counter ត្រូវបានកំណត់ទៅ 0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Events'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Counter: $counter',
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  showMessage('ElevatedButton ត្រូវបានចុច');
                },
                child: const Text('ElevatedButton'),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  showMessage('TextButton ត្រូវបានចុច');
                },
                child: const Text('TextButton'),
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                onPressed: () {
                  showMessage('OutlinedButton ត្រូវបានចុច');
                },
                child: const Text('OutlinedButton'),
              ),
              const SizedBox(height: 15),
              IconButton(
                onPressed: () {
                  showMessage('Favorite Icon ត្រូវបានចុច');
                },
                icon: const Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: increaseCounter,
                icon: const Icon(Icons.add),
                label: const Text('Increase Counter'),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: resetCounter,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Counter'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increaseCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
