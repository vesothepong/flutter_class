import 'package:flutter/material.dart';

void main() {
  runApp(const TapDetailsApp());
}

class TapDetailsApp extends StatelessWidget {
  const TapDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TapDetailsScreen(),
    );
  }
}

class TapDetailsScreen extends StatefulWidget {
  const TapDetailsScreen({super.key});

  @override
  State<TapDetailsScreen> createState() => _TapDetailsScreenState();
}

class _TapDetailsScreenState extends State<TapDetailsScreen> {
  String eventName = 'មិនទាន់មាន Event';
  String position = 'Position: 0, 0';
  Color boxColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap Detail Events'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              eventName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              position,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                setState(() {
                  eventName = 'onTapDown';
                  position =
                      'X: ${details.localPosition.dx.toStringAsFixed(1)}, '
                      'Y: ${details.localPosition.dy.toStringAsFixed(1)}';
                  boxColor = Colors.orange;
                });
              },
              onTapUp: (TapUpDetails details) {
                setState(() {
                  eventName = 'onTapUp';
                  position =
                      'X: ${details.localPosition.dx.toStringAsFixed(1)}, '
                      'Y: ${details.localPosition.dy.toStringAsFixed(1)}';
                  boxColor = Colors.green;
                });
              },
              onTapCancel: () {
                setState(() {
                  eventName = 'onTapCancel';
                  position = 'ការចុចត្រូវបានបោះបង់';
                  boxColor = Colors.red;
                });
              },
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'ប៉ះលើប្រអប់នេះ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
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
