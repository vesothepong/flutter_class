
import 'package:flutter/material.dart';

void main() {
  runApp(const DragEventApp());
}

class DragEventApp extends StatelessWidget {
  const DragEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragEventScreen(),
    );
  }
}

class DragEventScreen extends StatefulWidget {
  const DragEventScreen({super.key});

  @override
  State<DragEventScreen> createState() => _DragEventScreenState();
}

class _DragEventScreenState extends State<DragEventScreen> {
  double x = 0;
  double y = 0;
  String message = 'អូសប្រអប់ទៅគ្រប់ទិស';

  void resetPosition() {
    setState(() {
      x = 0;
      y = 0;
      message = 'ទីតាំងត្រូវបាន Reset';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag Event Project'),
        actions: [
          IconButton(
            onPressed: resetPosition,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              '$message\nX: ${x.toStringAsFixed(1)}\nY: ${y.toStringAsFixed(1)}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Positioned(
            left: 40 + x,
            top: 100 + y,
            child: GestureDetector(
              onPanStart: (details) {
                setState(() {
                  message = 'ចាប់ផ្ដើមអូស';
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  x += details.delta.dx;
                  y += details.delta.dy;
                  message = 'កំពុងអូស';
                });
              },
              onPanEnd: (details) {
                setState(() {
                  message = 'ការអូសបានបញ្ចប់';
                });
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.open_with,
                  size: 55,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
