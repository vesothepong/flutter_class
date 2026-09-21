import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Image Demo',
      home: ImageLocalScreen(),
    );
  }
}

class ImageLocalScreen extends StatelessWidget {
  const ImageLocalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Image"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Here is a local image:"),
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/LogoAUB.png", // path to image
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/LogoAUB01.png", // path to image
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
