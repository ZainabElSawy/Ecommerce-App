import 'package:flutter/material.dart';

class CustomTextTiteAuth extends StatelessWidget {
  final String title;
  const CustomTextTiteAuth({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
