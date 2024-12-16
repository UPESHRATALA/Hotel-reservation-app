// lib/utils/snack_bar.dart
import 'package:flutter/material.dart';

class SnackBarUtil {
  static void showSnackBar(BuildContext context, String message, {Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
