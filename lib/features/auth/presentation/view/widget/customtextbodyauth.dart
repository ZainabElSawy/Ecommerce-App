import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String content;
  const CustomTextBodyAuth({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
