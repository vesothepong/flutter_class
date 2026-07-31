import 'package:flutter/material.dart';
import 'package:flutter_learning/test/Ex1.dart';

/// ចំណុចចូលរបស់ App (main function)

void main() {
  runApp(const MyApp()); // បញ្ជា Flutter ឲ្យរាប់បញ្ចូល Widget MyApp ជា root
}

/// MyApp = Root Widget (Stateless UI មិនផ្លាស់ប្ដូរ)

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen1(),
      },
      initialRoute: '/',
      //home: ExScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp = Framework UI របស់ Google ស្ទាយ Material Design
    return MaterialApp(
      debugShowCheckedModeBanner: false, // លុប DEBUG ខាងស្តាំលើ
      title: 'Hello Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal, // ពណ៌សំខាន់របស់ App
      ),
      home: const HomeScreen(), // Screen ដំបូង
    );
  }
}

/// HomeScreen = Screen ដំបូង (Stateful ព្រោះមាន state គឺ count)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// _HomeScreenState = class ដែលផ្ទុក state (count) និង logic

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0; // state សម្រាប់រក្សាទុកតម្លៃលេខរាប់

  /// function បូកលេខរាប់
  void _incrementCounter() {
    setState(() {
      _counter++; // បន្ថែម ១
    });
    // setState() ឲ្យ Flutter repaint UI ម្តងទៀត ដើម្បីបង្ហាញតម្លៃថ្មី
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold = រចនាបទគោល (appBar + body + floatingActionButton ...)
    return Scaffold(
      appBar: AppBar(
        title: const Text('កម្រងរាប់លេខ Flutter'),
        centerTitle: true,
      ),
      body: Center(
        // Column = រៀប UI ជួរឈរ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ចុចប៊ូតុងខាងក្រោម ដើម្បីបូកលេខ៖ ចុចប៊ូតុងខាងក្រោម ដើម្បីបូកលេខ៖  ចុចប៊ូតុងខាងក្រោម ដើម្បីបូកលេខ៖ ចុចប៊ូតុងខាងក្រោម ដើម្បីបូកលេខ៖ ចុចប៊ូតុងខាងក្រោម ដើម្បីបូកលេខ៖',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 70, 152, 80),
                  backgroundColor: Color.fromARGB(255, 168, 175, 76),
                  letterSpacing: 1.0,
                  wordSpacing: 10.0,
                  height: 1.5),
            ),
            const SizedBox(height: 16),
            Text(
              '$_counter', // បង្ហាញតម្លៃ state
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(
                        text: 'Hello ', style: TextStyle(color: Colors.yellow)),
                    TextSpan(
                        text: 'Flutter ', style: TextStyle(color: Colors.red)),
                    TextSpan(
                        text: 'Programming ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _incrementCounter, // ពេលចុច (call function _incrementCounter)
        child: const Icon(Icons.add),
      ),
    );
  }
}
