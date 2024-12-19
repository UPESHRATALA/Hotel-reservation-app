import 'package:flutter/material.dart';
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
      theme: ThemeData(
        fontFamily: 'YourCustomFont', // Use your custom font here
        primaryColor:
            Colors.redAccent, // Primary color for AppBar, BottomNav, etc.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          accentColor: Colors.redAccent, // Use the secondary color here
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.redAccent, // Color for AppBar
          titleTextStyle: TextStyle(
            fontFamily: 'YourCustomFont',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomAppBarColor: Colors.redAccent, // Bottom navigation bar color
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16, color: Colors.red[700]),
          bodyText2: TextStyle(fontSize: 14, color: Colors.blue[700]),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
        ),
      ),
      home: SplashScreenView(), // Initially render the SplashScreen
    );
  }
}
