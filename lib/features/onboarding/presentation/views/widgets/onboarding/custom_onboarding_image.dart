import 'package:flutter/material.dart';

class CustomOnBoardingImage extends StatelessWidget {
  const CustomOnBoardingImage({
    super.key,
    required this.image,
    required this.size,
  });

  final String image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
