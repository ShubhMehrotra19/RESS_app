import 'package:flutter/material.dart';

class Retirement extends StatefulWidget {
  const Retirement({super.key});

  @override
  State<Retirement> createState() => _RetirementState();
}

class _RetirementState extends State<Retirement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Leave Details',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            Image.asset('assets/icons/i.png', width: 100, height: 100),
            const Text(
              'The Employee is not retired yet',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
