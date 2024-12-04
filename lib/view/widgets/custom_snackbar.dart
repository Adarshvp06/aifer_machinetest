import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackBar (BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}