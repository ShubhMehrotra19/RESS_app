import 'package:flutter/material.dart';
import 'package:frontend/home/sidebar/sidebar.dart';

class Incometax extends StatefulWidget {
  const Incometax({super.key});

  @override
  State<Incometax> createState() => _IncometaxState();
}

class _IncometaxState extends State<Incometax> {
  String _selectedLanguage = 'English';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Income Tax',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), // Space between title and input
              const Text(
                'Enter Financial Year (e.g., 2023 - 2024)',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10), // Space between text and text field
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter financial year',
                ),
              ),
              const SizedBox(height: 20), // Space before the button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700], // Button color
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20), // Internal padding
                  ),
                  child: const Text(
                    'Go',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
