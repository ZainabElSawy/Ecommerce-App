import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared/custom_button.dart';
import '../widgets/welcome_view/custom_welcome_view_title.dart';
import '../widgets/welcome_view/custome_welcome_view_body.dart';
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
                  const CustomWelconViewTitle(),
                  SizedBox(height: 24.h),
                  const CustomWelcomeViewBody(),
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
