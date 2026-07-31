
import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 5"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Screen 5",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

