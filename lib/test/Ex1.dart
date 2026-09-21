import 'package:flutter/material.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12183C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Where do you want to travel?',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.casino_outlined,
                      color: const Color(0xFF12183C),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Material(
                    color: const Color(0xFF2F5CF2),
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Select Destination',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.keyboard_arrow_down,
                                color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.search,
                      color: const Color(0xFF12183C),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
