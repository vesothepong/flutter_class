
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentListApp());
}

class StudentListApp extends StatelessWidget {
  const StudentListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: const StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() =>
      _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  final List<String> students = [
    'Sokha',
    'Dara',
    'Sophea',
    'Vanna',
    'Pisey',
  ];

  List<String> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    filteredStudents = List.from(students);
  }

  void addStudent() {
    String name = nameController.text.trim();

    if (name.isEmpty) {
      showMessage('សូមបញ្ចូលឈ្មោះនិស្សិត');
      return;
    }

    bool alreadyExists = false;

    // For-in Loop ស្វែងរកឈ្មោះស្ទួន
    for (String student in students) {
      if (student.toLowerCase() == name.toLowerCase()) {
        alreadyExists = true;
        break;
      }
    }

    if (alreadyExists) {
      showMessage('ឈ្មោះនេះមានរួចហើយ');
      return;
    }

    setState(() {
      students.add(name);
      filteredStudents = List.from(students);
      nameController.clear();
    });

    showMessage('បានបន្ថែម $name');
  }

  void searchStudent(String keyword) {
    List<String> searchResults = [];

    // For-in Loop ឆ្លងកាត់ឈ្មោះទាំងអស់
    for (String student in students) {
      if (student.toLowerCase().contains(keyword.toLowerCase())) {
        searchResults.add(student);
      }
    }

    setState(() {
      filteredStudents = searchResults;
    });
  }

  void deleteStudent(String name) {
    setState(() {
      students.remove(name);
      searchStudent(searchController.text);
    });

    showMessage('បានលុប $name');
  }

  void resetStudents() {
    searchController.clear();

    setState(() {
      filteredStudents = List.from(students);
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F3FC),
      appBar: AppBar(
        title: const Text('Student List Manager'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.purple,
            child: Column(
              children: [
                const Icon(
                  Icons.groups,
                  size: 60,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                const Text(
                  'បញ្ជីនិស្សិត',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'និស្សិតសរុប ${students.length} នាក់',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'ឈ្មោះនិស្សិតថ្មី',
                      prefixIcon: const Icon(Icons.person_add),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  onPressed: addStudent,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: searchController,
              onChanged: searchStudent,
              decoration: InputDecoration(
                labelText: 'ស្វែងរកនិស្សិត',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: resetStudents,
                  icon: const Icon(Icons.close),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: filteredStudents.isEmpty
                ? const Center(
                    child: Text('រកមិនឃើញនិស្សិត'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: filteredStudents.length,
                    itemBuilder: (context, index) {
                      String student = filteredStudents[index];

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            child: Text('${index + 1}'),
                          ),
                          title: Text(
                            student,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text('Flutter Student'),
                          trailing: IconButton(
                            onPressed: () {
                              deleteStudent(student);
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
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