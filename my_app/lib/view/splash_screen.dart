import 'package:flutter/material.dart';
import 'package:my_app/view/onboard_screen.dart'; // Assuming OnboardingScreen is in this path
import 'dart:async';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to OnboardingScreen after 2 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OnboardingScreen()), // You can change this to HomeScreen if preferred
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.orange
            ], // Gradient for the splash screen
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png', // Replace with your actual logo file
            width: 150, // Optionally set width and height for the logo
            height: 150,
          ),
        ),
      ),
    );
  }
}
