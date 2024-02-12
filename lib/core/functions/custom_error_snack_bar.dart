import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red.withOpacity(0.8),
      content: Text(text),
    ),
  );
}
