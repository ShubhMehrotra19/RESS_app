import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController employeeNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> validateLogin(String employeeNo, String password) async {
    try {
      final url = Uri.parse('http://localhost:8080/user/login');

      final headers = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*'
      };
      final msg = json.encode({
        'employee_number': employeeNo,
        'password': password,
      });

      final response = await http.post(url, headers: headers, body: msg);

      if (response.statusCode == 200) return true;
      if (response.statusCode == 401) throw Exception("Invalid Credentials");
      throw Exception("Unexpected Error: ${response.body}");
    } on TimeoutException {
      throw Exception("Connection timed out");
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Padding(
          padding: EdgeInsets.only(left: 15.0, bottom: 50.0, top: 20.0),
          child: Text(
            'Railway Employee Self Service',
            style: TextStyle(fontSize: 26.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/IndianRailway.png',
                          width: 100, height: 100),
                      Image.asset('assets/images/Azadi.png',
                          width: 150, height: 100),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  _buildLoginForm(context),
                  const SizedBox(height: 20.0),
                  const Text('New Registration',
                      style: TextStyle(fontSize: 18.0)),
                  const SizedBox(height: 35.0),
                  const Text('Forgot Password?',
                      style: TextStyle(fontSize: 18.0)),
                  const SizedBox(height: 40.0),
                  _buildFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _buildTextField('Employee NO.', 'Enter Employee No',
              controller: employeeNoController),
          const SizedBox(height: 30.0),
          _buildTextField('Password', 'Enter Password',
              obscureText: true, controller: passwordController),
          const SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () async {
              try {
                String employeeNo = employeeNoController.text;
                String password = passwordController.text;

                bool isLoginValid = await validateLogin(employeeNo, password);

                if (isLoginValid) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                }
              } catch (error) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Login Failed'),
                      content: Text(error.toString()),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            child: const Text('Sign in',
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      {bool obscureText = false, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        obscureText: obscureText,
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Contact us', style: TextStyle(fontSize: 18.0)),
              Text('Version: 2.0.2', style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/cris.png', width: 50, height: 50),
              const SizedBox(width: 10.0),
              const Text(
                'Designed and Developed by Shubh Mehrotra',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
