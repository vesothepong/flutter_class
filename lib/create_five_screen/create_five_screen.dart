import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const EventApp1());
}

class EventApp1 extends StatelessWidget {
  const EventApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigator Push',
      home: HomeScreen(),
    );
  }
}
