
import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 4"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Screen 4",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}