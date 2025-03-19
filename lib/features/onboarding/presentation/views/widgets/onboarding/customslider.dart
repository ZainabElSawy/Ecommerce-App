import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/onboarding/data/entities/onboardingmodel.dart';
import 'package:ecommerce_app/features/onboarding/presentation/views/widgets/onboarding/custom_onboarding_contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/datasource/local_data_Source.dart';
import '../../../manager/onboarding_cubit/on_boarding_cubit.dart';
import 'custom_onboarding_title.dart';
import 'custom_onboarding_image.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> onBoardingList =
        initializeOnBoardingList(context);
    final size = MediaQuery.of(context).size;
    return PageView.builder(
      controller: context.read<OnBoardingCubit>().pageController,
      onPageChanged: (value) {
        context.read<OnBoardingCubit>().onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          CustomOnBoardingImage(
            image: onBoardingList[index].image!,
            size: size,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(16.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.r),
                  topRight: Radius.circular(35.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  CustomOnBoardingTitle(index: index),
                  const Spacer(),
                  CustomOnBoardingContant(body: onBoardingList[index].body!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
