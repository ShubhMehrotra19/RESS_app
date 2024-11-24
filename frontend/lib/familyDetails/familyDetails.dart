import 'package:flutter/material.dart';
import 'package:frontend/home/sidebar/sidebar.dart';

class Familydetails extends StatefulWidget {
  const Familydetails({super.key});

  @override
  State<Familydetails> createState() => _FamilydetailsState();
}

class _FamilydetailsState extends State<Familydetails> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Family Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                children: const [
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Relation',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Date of Birth',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Shubh Mehrotra'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Son'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('2nd Sept 2003'),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Avni Mehrotra'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Daughter'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('24th Jul 2005'),
                    ),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
