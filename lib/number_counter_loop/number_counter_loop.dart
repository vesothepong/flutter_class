import 'package:flutter/material.dart';

void main() {
  runApp(const NumberCounterApp());
}

class NumberCounterApp extends StatelessWidget {
  const NumberCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const NumberCounterScreen(),
    );
  }
}

class NumberCounterScreen extends StatefulWidget {
  const NumberCounterScreen({super.key});

  @override
  State<NumberCounterScreen> createState() => _NumberCounterScreenState();
}

class _NumberCounterScreenState extends State<NumberCounterScreen> {
  final TextEditingController numberController = TextEditingController();

  List<int> numbers = [];
  String message = 'សូមបញ្ចូលលេខចុងក្រោយ';

  void generateNumbers() {
    int? maximumNumber = int.tryParse(
      numberController.text.trim(),
    );

    if (maximumNumber == null) {
      setState(() {
        numbers.clear();
        message = 'សូមបញ្ចូលលេខឱ្យបានត្រឹមត្រូវ';
      });
      return;
    }

    if (maximumNumber < 1 || maximumNumber > 100) {
      setState(() {
        numbers.clear();
        message = 'សូមបញ្ចូលលេខពី 1 ដល់ 100';
      });
      return;
    }

    List<int> generatedNumbers = [];

    // For Loop រាប់ពី 1 ដល់ maximumNumber
    for (int i = 1; i <= maximumNumber; i++) {
      generatedNumbers.add(i);
    }

    setState(() {
      numbers = generatedNumbers;
      message = 'បានបង្កើតលេខចំនួន ${numbers.length}';
    });
  }

  void clearData() {
    numberController.clear();

    setState(() {
      numbers.clear();
      message = 'សូមបញ្ចូលលេខចុងក្រោយ';
    });
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5FF),
      appBar: AppBar(
        title: const Text('Number Counter'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.indigo, Colors.deepPurple],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.numbers,
                  size: 65,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'កម្មវិធីរាប់លេខ',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'អនុវត្តការប្រើ For Loop',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'លេខចុងក្រោយ',
                hintText: 'ឧទាហរណ៍៖ 20',
                prefixIcon: const Icon(Icons.pin),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: generateNumbers,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('បង្កើតលេខ'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: clearData,
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: numbers.isEmpty
                ? const Center(
                    child: Text('មិនទាន់មានលេខ'),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      int number = numbers[index];

                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: number % 2 == 0
                              ? Colors.indigo
                              : Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '$number',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
