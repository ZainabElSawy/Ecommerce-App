import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomOfferCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomOfferCard({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
              color: AppColor.primarycolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                subTitle,
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: sharedPreferences?.getString("lang") == "en" ? -20 : null,
            left: sharedPreferences?.getString("lang") == "ar" ? -20 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.secondarycolor,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          )
        ],
      ),
    );
  }
}
