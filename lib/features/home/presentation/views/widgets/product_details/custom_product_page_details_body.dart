import 'package:flutter/material.dart';

class CustomProductPageDetailsBody extends StatelessWidget {
  const CustomProductPageDetailsBody({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(height: 1.7),
    );
  }
}

