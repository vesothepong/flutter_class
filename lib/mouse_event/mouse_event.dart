
import 'package:flutter/material.dart';

void main() {
  runApp(const MouseEventApp());
}

class MouseEventApp extends StatelessWidget {
  const MouseEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(                                                   
      debugShowCheckedModeBanner: false,
      title: 'Mouse Event Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const MouseEventScreen(),
    );
  }
}

class MouseEventScreen extends StatefulWidget {
  const MouseEventScreen({super.key});

  @override
  State<MouseEventScreen> createState() => _MouseEventScreenState();
}

class _MouseEventScreenState extends State<MouseEventScreen> {
  String eventMessage = 'សូមដាក់ Mouse លើប្រអប់';
  String mousePosition = 'X: 0, Y: 0';
  bool isMouseInside = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mouse Events'),
        centerTitle: true,
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
            const SizedBox(height: 10),
            Text(
              mousePosition,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) {
                setState(() {
                  isMouseInside = true;
                  eventMessage = 'Mouse បានចូលក្នុងប្រអប់';
                });
              },
              onExit: (event) {
                setState(() {
                  isMouseInside = false;
                  eventMessage = 'Mouse បានចេញពីប្រអប់';
                  mousePosition = 'X: 0, Y: 0';
                });
              },
              onHover: (event) {
                setState(() {
                  eventMessage = 'Mouse កំពុងផ្លាស់ទីលើប្រអប់';
                  mousePosition =
                      'X: ${event.localPosition.dx.toStringAsFixed(1)}, '
                      'Y: ${event.localPosition.dy.toStringAsFixed(1)}';
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isMouseInside ? 320 : 280,
                height: isMouseInside ? 220 : 180,
                decoration: BoxDecoration(
                  color: isMouseInside
                      ? Colors.orange
                      : Colors.blue,
                  borderRadius: BorderRadius.circular(
                    isMouseInside ? 35 : 20,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5),
                      blurRadius: isMouseInside ? 20 : 8,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.mouse,
                      size: 75,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Move Mouse Here',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

