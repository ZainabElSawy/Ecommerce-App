import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomProductPageDetailsTitle extends StatelessWidget {
  const CustomProductPageDetailsTitle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: AppColor.fourthcolor,
          ),
    );
  }
}