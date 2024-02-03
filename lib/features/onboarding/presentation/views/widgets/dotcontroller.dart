import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/color.dart';
import '../../../data/datasource/local_data_Source.dart';
import '../../manager/onboarding_cubit/on_boarding_cubit.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingListLength = initializeOnBoardingList(context).length;
    return BlocBuilder<OnBoardingCubit, OnBoardingIndex>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingListLength,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.only(right: 5),
                duration: const Duration(milliseconds: 900),
                width: state.index == index ? 20 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColor.primarycolor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
