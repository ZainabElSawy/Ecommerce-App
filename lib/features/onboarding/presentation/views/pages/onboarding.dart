import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../widgets/custombutton.dart';
import '../widgets/customslider.dart';
import '../widgets/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 4, child: CustomSliderOnBoarding()),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  Spacer(flex: 2),
                  CustomButtonOnBoarding()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
