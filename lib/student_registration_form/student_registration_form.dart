import 'package:flutter/material.dart';

void main() {
  runApp(const StudentFormApp());
}

class StudentFormApp extends StatelessWidget {
  const StudentFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Registration Form',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffF4F6FA),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xffDDE2EA),
            ),
          ),
        ),
      ),
      home: const StudentRegistrationScreen(),
    );
  }
}

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({super.key});

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController idController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  String selectedGender = 'Male';
  String? selectedMajor;
  DateTime? selectedDate;

  bool knowsDart = false;
  bool knowsFlutter = false;
  bool knowsDatabase = false;
  bool acceptTerms = false;
  bool receiveNotification = true;

  final List<String> majors = [
    'Computer Science',
    'Information Technology',
    'Software Engineering',
    'Data Science',
  ];

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  List<String> getSelectedSkills() {
    List<String> skills = [];

    if (knowsDart) {
      skills.add('Dart');
    }

    if (knowsFlutter) {
      skills.add('Flutter');
    }

    if (knowsDatabase) {
      skills.add('Database');
    }

    return skills;
  }

  void submitForm() {
    bool isFormValid = formKey.currentState!.validate();

    if (!isFormValid) {
      return;
    }

    if (selectedDate == null) {
      showMessage('សូមជ្រើសរើសថ្ងៃខែឆ្នាំកំណើត');
      return;
    }

    if (!acceptTerms) {
      showMessage('សូមយល់ព្រមតាមលក្ខខណ្ឌ');
      return;
    }

    showResultDialog();
  }

  void showResultDialog() {
    List<String> skills = getSelectedSkills();

    String formattedDate =
        '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              SizedBox(width: 10),
              Text('Registration Result'),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                resultRow(
                  'Student ID',
                  idController.text,
                ),
                resultRow(
                  'Name',
                  nameController.text,
                ),
                resultRow(
                  'Email',
                  emailController.text,
                ),
                resultRow(
                  'Phone',
                  phoneController.text,
                ),
                resultRow(
                  'Gender',
                  selectedGender,
                ),
                resultRow(
                  'Major',
                  selectedMajor ?? '',
                ),
                resultRow(
                  'Date of Birth',
                  formattedDate,
                ),
                resultRow(
                  'Skills',
                  skills.isEmpty ? 'No Skill Selected' : skills.join(', '),
                ),
                resultRow(
                  'Notification',
                  receiveNotification ? 'Enabled' : 'Disabled',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                clearForm();
              },
              child: const Text('New Registration'),
            ),
          ],
        );
      },
    );
  }

  Widget resultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void clearForm() {
    formKey.currentState!.reset();

    idController.clear();
    nameController.clear();
    emailController.clear();
    phoneController.clear();

    setState(() {
      selectedGender = 'Male';
      selectedMajor = null;
      selectedDate = null;

      knowsDart = false;
      knowsFlutter = false;
      knowsDatabase = false;
      acceptTerms = false;
      receiveNotification = true;
    });

    showMessage('Form ត្រូវបានសម្អាត');
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Registration'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            buildHeader(),
            const SizedBox(height: 25),

            buildSectionTitle(
              icon: Icons.person_outline,
              title: 'Personal Information',
            ),

            const SizedBox(height: 15),

            // Student ID
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'Student ID',
                hintText: 'ឧទាហរណ៍៖ ST001',
                prefixIcon: Icon(Icons.badge_outlined),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'សូមបញ្ចូល Student ID';
                }

                if (value.trim().length < 3) {
                  return 'Student ID ត្រូវមានយ៉ាងតិច 3 តួ';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            // Full Name
            TextFormField(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'បញ្ចូលឈ្មោះពេញ',
                prefixIcon: Icon(Icons.person_outline),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'សូមបញ្ចូលឈ្មោះ';
                }

                if (value.trim().length < 3) {
                  return 'ឈ្មោះត្រូវមានយ៉ាងតិច 3 តួ';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            // Email
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'student@example.com',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'សូមបញ្ចូល Email';
                }

                if (!value.contains('@') || !value.contains('.')) {
                  return 'Email មិនត្រឹមត្រូវ';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            // Phone
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: '012345678',
                prefixIcon: Icon(Icons.phone_outlined),
                counterText: '',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'សូមបញ្ចូលលេខទូរស័ព្ទ';
                }

                if (value.trim().length < 8) {
                  return 'លេខទូរស័ព្ទត្រូវមានយ៉ាងតិច 8 ខ្ទង់';
                }

                return null;
              },
            ),

            const SizedBox(height: 25),

            buildSectionTitle(
              icon: Icons.wc,
              title: 'Gender',
            ),

            // Radio Button
            RadioListTile<String>(
              title: const Text('Male'),
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Female'),
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            buildSectionTitle(
              icon: Icons.school_outlined,
              title: 'Academic Information',
            ),

            const SizedBox(height: 15),

            // Dropdown
            DropdownButtonFormField<String>(
              value: selectedMajor,
              decoration: const InputDecoration(
                labelText: 'Select Major',
                prefixIcon: Icon(Icons.menu_book_outlined),
              ),
              items: majors.map((major) {
                return DropdownMenuItem<String>(
                  value: major,
                  child: Text(major),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMajor = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'សូមជ្រើសរើសជំនាញ';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            // Date Picker
            InkWell(
              onTap: selectDate,
              borderRadius: BorderRadius.circular(15),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  prefixIcon: Icon(
                    Icons.calendar_month_outlined,
                  ),
                ),
                child: Text(
                  selectedDate == null
                      ? 'ជ្រើសរើសថ្ងៃខែឆ្នាំកំណើត'
                      : '${selectedDate!.day}/'
                          '${selectedDate!.month}/'
                          '${selectedDate!.year}',
                ),
              ),
            ),

            const SizedBox(height: 25),

            buildSectionTitle(
              icon: Icons.code,
              title: 'Programming Skills',
            ),

            // Checkbox
            CheckboxListTile(
              title: const Text('Dart'),
              subtitle: const Text(
                'Dart Programming Language',
              ),
              value: knowsDart,
              onChanged: (value) {
                setState(() {
                  knowsDart = value ?? false;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Flutter'),
              subtitle: const Text(
                'Mobile Application Development',
              ),
              value: knowsFlutter,
              onChanged: (value) {
                setState(() {
                  knowsFlutter = value ?? false;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Database'),
              subtitle: const Text(
                'SQLite, MySQL or PostgreSQL',
              ),
              value: knowsDatabase,
              onChanged: (value) {
                setState(() {
                  knowsDatabase = value ?? false;
                });
              },
            ),

            const SizedBox(height: 15),

            buildSectionTitle(
              icon: Icons.settings_outlined,
              title: 'Settings',
            ),

            // Switch
            SwitchListTile(
              title: const Text('Receive Notifications'),
              subtitle: const Text(
                'ទទួលព័ត៌មាន និងការជូនដំណឹង',
              ),
              value: receiveNotification,
              onChanged: (value) {
                setState(() {
                  receiveNotification = value;
                });
              },
            ),

            // Accept Terms Checkbox
            CheckboxListTile(
              title: const Text('Accept Terms and Conditions'),
              subtitle: const Text(
                'ខ្ញុំយល់ព្រមតាមលក្ខខណ្ឌនៃការចុះឈ្មោះ',
              ),
              value: acceptTerms,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  acceptTerms = value ?? false;
                });
              },
            ),

            const SizedBox(height: 25),

            // Submit and Reset Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: clearForm,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: submitForm,
                    icon: const Icon(Icons.send),
                    label: const Text('Submit'),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff4F46E5),
            Color(0xff7C3AED),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.app_registration,
              color: Colors.indigo,
              size: 36,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student Form',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'បំពេញព័ត៌មានចុះឈ្មោះនិស្សិត',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle({
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.indigo,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
