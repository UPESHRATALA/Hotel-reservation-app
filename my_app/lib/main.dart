import 'package:flutter/material.dart';
import 'package:my_app/view/splash_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(SastoHotelApp());
}

class SastoHotelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sasto Hotel',
      home: SplashScreen(),
    );
  }
}
