import 'package:flutter/material.dart';

void main() {
  runApp(const MultiplicationApp());
}

class MultiplicationApp extends StatelessWidget {
  const MultiplicationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ), 
      home: const MultiplicationScreen(),
    );
  }
}

class MultiplicationScreen extends StatefulWidget {
  const MultiplicationScreen({super.key});

  @override
  State<MultiplicationScreen> createState() => _MultiplicationScreenState();
}

class _MultiplicationScreenState extends State<MultiplicationScreen> {
  final TextEditingController numberController = TextEditingController();

  List<String> multiplicationTable = [];
  String title = 'សូមបញ្ចូលលេខ';

  void generateTable() {
    int? number = int.tryParse(numberController.text.trim());

    if (number == null) {
      setState(() {
        title = 'សូមបញ្ចូលលេខឱ្យបានត្រឹមត្រូវ';
        multiplicationTable.clear();
      });
      return;
    }

    if (number < 1 || number > 100) {
      setState(() {
        title = 'សូមបញ្ចូលលេខពី 1 ដល់ 100';
        multiplicationTable.clear();
      });
      return;
    }

    List<String> generatedTable = [];

    for (int i = 1; i <= 12; i++) {
      int result = number * i;

      generatedTable.add(
        '$number × $i = $result',
      );
    }

    setState(() {
      multiplicationTable = generatedTable;
      title = 'តារាងគុណមេ $number';
    });
  }

  void clearData() {
    numberController.clear();

    setState(() {
      multiplicationTable.clear();
      title = 'សូមបញ្ចូលលេខ';
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
      backgroundColor: const Color(0xffFFF7ED),
      appBar: AppBar(
        title: const Text('Multiplication Table'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.deepOrange.shade600,
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.grid_on,
                  size: 65,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'កម្មវិធីតារាងគុណ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'បង្កើតពី × 1 ដល់ × 12',
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
                labelText: 'បញ្ចូលមេគុណ',
                hintText: 'ឧទាហរណ៍៖ 5',
                prefixIcon: const Icon(Icons.close),
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
                    onPressed: generateTable,
                    icon: const Icon(Icons.grid_view),
                    label: const Text('បង្កើតតារាងគុណ'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.orange,
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
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: multiplicationTable.isEmpty
                ? const Center(
                    child: Text('មិនទាន់មានតារាងគុណ'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: multiplicationTable.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? Colors.orange.shade100
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              child: Text('${index + 1}'),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              multiplicationTable[index],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
