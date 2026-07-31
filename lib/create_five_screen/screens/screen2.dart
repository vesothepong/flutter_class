
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 2"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Screen 2",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

