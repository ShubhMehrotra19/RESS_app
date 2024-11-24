import 'package:flutter/material.dart';
import 'package:frontend/incomeTax/incomeTax.dart';
import 'package:frontend/leave/leave.dart';
import 'package:frontend/providentFund/providentFund.dart';
import 'package:frontend/retirement/retirement.dart';
import 'package:frontend/loans/loans.dart';
import 'package:frontend/familyDetails/familyDetails.dart';
import 'package:frontend/home/sidebar/sidebar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectedLanguage = 'English';

  // List of items with image paths, texts, and corresponding routes
  final List<Map<String, String>> items = [
    {
      'image': 'assets/icons/bioData.png',
      'text': 'Bio Data',
      'route': '/bioData'
    },
    {'image': 'assets/icons/salary.png', 'text': 'Salary', 'route': '/salary'},
    {
      'image': 'assets/icons/provident.png',
      'text': 'Provident Fund',
      'route': '/providentFund'
    },
    {
      'image': 'assets/icons/incomeTax.png',
      'text': 'Income Tax',
      'route': '/incomeTax'
    },
    {
      'image': 'assets/icons/loans.png',
      'text': 'Loans/Advances',
      'route': '/loans'
    },
    {'image': 'assets/icons/leave.png', 'text': 'Leave', 'route': '/leave'},
    {
      'image': 'assets/icons/family.png',
      'text': 'Family',
      'route': '/familyDetails'
    },
    {
      'image': 'assets/icons/benefit.png',
      'text': 'Retirement Benefits',
      'route': '/retirement'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/railLogo.png',
              width: 30,
              height: 30,
            ),
            const Text(
              'RESS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Image.asset(
              'assets/images/cris.png',
              width: 30,
              height: 30,
            ),
            Image.asset(
              'assets/icons/bell.png',
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: PopupMenuButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 35,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: RadioListTile(
                      title: const Text('English'),
                      value: 'English',
                      groupValue: _selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          _selectedLanguage = value!;
                        });
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: RadioListTile(
                      title: const Text('Hindi'),
                      value: 'Hindi',
                      groupValue: _selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          _selectedLanguage = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    'Railway Employee Self Service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Indian Railways',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey[800]!,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Welcome, Shubh Mehrotra',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              'No image found',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: items
                        .map((item) => _buildBox(
                            item['image']!, item['text']!, item['route']!))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(String imagePath, String text, String route) {
    return GestureDetector(
      onTap: () {
        if (route == '/incomeTax') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Incometax()),
          );
        } else if (route == '/leave') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Leave()),
          );
        } else if (route == '/providentFund') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Providentfund()));
        } else if (route == '/retirement') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Retirement()));
        } else if (route == '/loans') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Loans()));
        } else if (route == '/familyDetails') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Familydetails()));
        }
      },
      child: Container(
        width: 100,
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.blue[700],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
