import 'package:ecommerce_app/features/onboarding/data/entities/onboardingmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/local_data_Source.dart';
import '../../manager/onboarding_cubit/on_boarding_cubit.dart';
import 'custom_onboarding_contant.dart';
import 'custom_onboarding_image.dart';
import 'custom_onboarding_title.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomOnBoardingImage(
              image: onBoardingList[index].image!, size: size),
          const SizedBox(height: 80),
          CustomOnBoardingTitle(title: onBoardingList[index].title!),
          const SizedBox(height: 20),
          CustomOnBoardingContant(body: onBoardingList[index].body!),
        ],
      ),
    );
  }
}
