import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import '../widgets/onboarding/customslider.dart';
import '../widgets/onboarding/dotcontroller.dart';
import '../widgets/onboarding/custom_onboarding_skip_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SafeArea(
        child: Column(
          children: [
            CustomOnboardingSkipButton(),
            Expanded(child: CustomSliderOnBoarding()),
            CustomDotControllerOnBoarding(),
          ],
        ),
      ),
    );
  }
}
