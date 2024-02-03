import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';

class ConsumButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const ConsumButtonLang({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        minWidth: 170,
        height: 35,
        onPressed: onPressed,
        color: AppColor.primarycolor,
        textColor: Colors.white,
        child: Text(
          textButton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
