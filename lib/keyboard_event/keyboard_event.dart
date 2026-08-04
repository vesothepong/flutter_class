
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const KeyboardEventApp());
}

class KeyboardEventApp extends StatelessWidget {
  const KeyboardEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keyboard Event Project',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const KeyboardEventScreen(),
    );
  }
}

class KeyboardEventScreen extends StatefulWidget {
  const KeyboardEventScreen({super.key});

  @override
  State<KeyboardEventScreen> createState() =>
      _KeyboardEventScreenState();
}

class _KeyboardEventScreenState
    extends State<KeyboardEventScreen> {
  final FocusNode keyboardFocusNode = FocusNode();

  String pressedKey = 'មិនទាន់បានចុច Key';
  String eventType = 'No Event';
  double x = 0;
  double y = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      keyboardFocusNode.requestFocus();
    });
  }

  void handleKeyEvent(KeyEvent event) {
    setState(() {
      pressedKey = event.logicalKey.keyLabel;

      if (event is KeyDownEvent) {
        eventType = 'Key Down';

        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          x -= 10;
        } else if (event.logicalKey ==
            LogicalKeyboardKey.arrowRight) {
          x += 10;
        } else if (event.logicalKey ==
            LogicalKeyboardKey.arrowUp) {
          y -= 10;
        } else if (event.logicalKey ==
            LogicalKeyboardKey.arrowDown) {
          y += 10;
        } else if (event.logicalKey ==
            LogicalKeyboardKey.space) {
          x = 0;
          y = 0;
        }
      } else if (event is KeyUpEvent) {
        eventType = 'Key Up';
      }
    });
  }

  @override
  void dispose() {
    keyboardFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyboard Events'),
        centerTitle: true,
      ),
      body: KeyboardListener(
        focusNode: keyboardFocusNode,
        autofocus: true,
        onKeyEvent: handleKeyEvent,
        child: GestureDetector(
          onTap: () {
            keyboardFocusNode.requestFocus();
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.shade100,
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 20,
                  right: 20,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            'ចុច Arrow Keys ដើម្បីផ្លាស់ទីប្រអប់',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'ចុច Space ដើម្បី Reset',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Key: $pressedKey',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.indigo,
                            ),
                          ),
                          Text(
                            'Event: $eventType',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 140 + x,
                  top: 300 + y,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.keyboard,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

