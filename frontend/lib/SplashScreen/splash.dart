import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/Login/Login.dart'; // Import the Login screen

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Navigate to Login after 1 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[700],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/railLogo.png',
                width: 100,
                height: 100,
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Indian Railways',
                        style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'welcomes you \n to',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 21.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Railway Employee Self Service',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                          letterSpacing: 0.1,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset('assets/images/cris.png',
                            width: 100, height: 100),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                        child: Text(
                          'Center for Railway Information \n Systems',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Text(
                        '(An Organization of the Ministry of Railways, Govt. of India)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
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
