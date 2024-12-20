import 'package:flutter/material.dart';
import 'package:my_app/core/app_theme/app_theme.dart';
import 'package:my_app/view/splash_screen.dart'; // Make sure you import the SplashScreen
import 'package:my_app/view/home_screen.dart'; // Import HomeScreen here

void main() {
  runApp(SastoHotelApp());
}

class SastoHotelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sasto Hotel',
      theme: getApplicationTheme(),


      home: SplashScreenView(), // Initially render the SplashScreen
    );
  }
}
