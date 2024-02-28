import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'custom_try_again_button.dart';

class AuthFailureState extends StatelessWidget {
  const AuthFailureState({
    super.key,
    required this.onPressed,
    required this.image,
  });
  final void Function()? onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            image,
            width: 250,
            height: 250,
          ),
        ),
        const SizedBox(height: 50),
        CustomTryAgainButton(onPressed: onPressed),
      ],
    );
  }
}
