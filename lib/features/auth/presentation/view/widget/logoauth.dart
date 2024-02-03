import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.asset(
          AppImageAsset.logo,
          fit: BoxFit.fill,
          height: 160,
        ),
      ),
    );
  }
}
