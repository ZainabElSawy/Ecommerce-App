import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/routes.dart';
import '../../../../data/datasource/local_data_Source.dart';
import '../../../manager/onboarding_cubit/on_boarding_cubit.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingListLength = initializeOnBoardingList(context).length;
    return BlocBuilder<OnBoardingCubit, OnBoardingIndex>(
      builder: (context, state) {
        return Container(
          color: AppColor.white,
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: state.index == 0
                    ? null
                    : () => context
                        .read<OnBoardingCubit>()
                        .pageController
                        .animateToPage(
                          state.index - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceInOut,
                        ),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        state.index == 0 ? Colors.transparent : AppColor.white,
                    border: Border.all(
                        color: state.index == 0
                            ? Colors.transparent
                            : AppColor.brownPrimaryColor),
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: state.index == 0
                        ? Colors.transparent
                        : AppColor.brownPrimaryColor,
                    size: 18.sp,
                  ),
                ),
              ),
              const Spacer(),
              ...List.generate(
                onBoardingListLength,
                (index) => AnimatedContainer(
                  margin: const EdgeInsets.only(right: 8),
                  duration: const Duration(milliseconds: 900),
                  width: state.index == index ? 14.w : 10.w,
                  height: state.index == index ? 14.h : 10.h,
                  decoration: BoxDecoration(
                    color: state.index == index
                        ? AppColor.brownPrimaryColor
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: state.index == 2
                    ? () => context.pushPage(route: AppRouter.login)
                    : () => context
                        .read<OnBoardingCubit>()
                        .pageController
                        .animateToPage(
                          state.index + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.brownPrimaryColor,
                    border: Border.all(
                      color: AppColor.brownPrimaryColor,
                    ),
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    color: AppColor.white,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
