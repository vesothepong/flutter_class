
import 'package:flutter/material.dart';

void main() {
  runApp(const GestureEventApp());
}

class GestureEventApp extends StatelessWidget {
  const GestureEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const GestureEventScreen(),
    );
  }
}

class GestureEventScreen extends StatefulWidget {
  const GestureEventScreen({super.key});

  @override
  State<GestureEventScreen> createState() => _GestureEventScreenState();
}

class _GestureEventScreenState extends State<GestureEventScreen> {
  String eventMessage = 'សូមចុចលើប្រអប់';
  Color boxColor = Colors.deepPurple;

  void updateEvent(String message, Color color) {
    setState(() {
      eventMessage = message;
      boxColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Events'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              eventMessage,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                updateEvent(
                  'អ្នកបានចុចមួយដង',
                  Colors.blue,
                );
              },
              onDoubleTap: () {
                updateEvent(
                  'អ្នកបានចុចពីរដង',
                  Colors.green,
                );
              },
              onLongPress: () {
                updateEvent(
                  'អ្នកបានចុចយូរ',
                  Colors.orange,
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: 250,
                height: 180,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Tap\nDouble Tap\nLong Press',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
