import 'package:my_app/view/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to OnboardingScreen after 2 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            // width: 150,
            // height: 150,
          ),
        ),
      ),
    );
  }
}
