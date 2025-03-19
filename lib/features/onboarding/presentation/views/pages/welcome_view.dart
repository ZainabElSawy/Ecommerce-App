import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/styles.dart';
import '../../../../../core/shared/custom_button.dart';
import '../widgets/welcome_view/custom_login_row.dart';
import '../widgets/welcome_view/custom_welcome_view_image.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            const CustomWelcomeViewImage(),
            SizedBox(height: 35.h),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "The ",
                      style: Styles.textStyleBold23,
                      children: [
                        TextSpan(
                          text: "Fashion App",
                          style: Styles.textStyleBold23.copyWith(
                            color: AppColor.brownPrimaryColor,
                          ), // TextStyle(
                        ),
                        TextSpan(
                          text: "That \nMakes you Look Your Best",
                          style: Styles.textStyleBold23,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "Discover the latest trends, express \nyourself, and redefine fashion your way. Join us!",
                    style: Styles.textStyleRegular14,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    text: "Let's Get Started",
                    onTap: () => context.pushPage(route: AppRouter.onBoarding),
                  ),
                  SizedBox(height: 26.h),
                  const CustomLoginRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
