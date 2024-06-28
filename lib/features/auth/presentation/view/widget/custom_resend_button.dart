import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomResendButton extends StatelessWidget {
  final Function()? onTap;
  final bool enabled;

  const CustomResendButton({
    Key? key,
    this.onTap,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onTap : null,
      child: Text(
        'Resend',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: enabled ? AppColor.primarycolor : Colors.grey,
          fontSize: 18,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.w700,
          decorationColor: enabled ? AppColor.primarycolor : Colors.grey,
          decoration: enabled ? TextDecoration.underline : TextDecoration.none,
          decorationThickness: enabled ? 2 : 0,
          height: 0.1,
        ),
      ),
    );
  }
}
