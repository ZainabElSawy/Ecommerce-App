import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/routes.dart';
import '../../../manager/onboarding_cubit/on_boarding_cubit.dart';

class CustomOnboardingSkipButton extends StatelessWidget {
  const CustomOnboardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingIndex>(
      builder: (context, state) {
        return Row(children: [
          const Spacer(),
          InkWell(
            onTap: state.index == 2
                ? null
                : () => context.pushPage(route: AppRouter.login),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                "Skip",
                style: TextStyle(
                  color: state.index == 2
                      ? Colors.transparent
                      : AppColor.brownPrimaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]);
      },
    );
  }
}
