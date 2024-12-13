import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with a warm gradient overlay
          Positioned.fill(
            child: Image.asset(
              'assets/images/register.png', // Ensure this matches your pubspec.yaml
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    'Image not found',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                );
              },
            ),
          ),