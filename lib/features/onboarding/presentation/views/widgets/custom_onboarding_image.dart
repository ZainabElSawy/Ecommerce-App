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
      height: size.height / 2.4,
      fit: BoxFit.fill,
    );
  }
}
