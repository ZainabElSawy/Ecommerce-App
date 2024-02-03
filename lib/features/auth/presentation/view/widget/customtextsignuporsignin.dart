import 'package:flutter/material.dart';

import '../../../../../../../../core/constant/color.dart';
class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function()? onTap;
  const CustomTextSignUpOrSignIn({
    Key? key,
    required this.textone,
    required this.texttwo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily:
                  // myServices.sharedPreferences!.getString("lang") == "en"
                  //     ? "PlayfairDisplay"
                  //     : 
                      "Cairo",
            )),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: const TextStyle(
              color: AppColor.primarycolor,
              fontWeight: FontWeight.bold,
              fontFamily:
                  // myServices.sharedPreferences!.getString("lang") == "en"
                  //     ? "PlayfairDisplay"
                  //     :
                       "Cairo",
            ),
          ),
        )
      ],
    );
  }
}
