import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';
import '../../../data/datasource/local_data_Source.dart';
import '../../../data/entities/onboardingmodel.dart';
import '../../manager/onboarding_cubit/on_boarding_cubit.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> onBoardingList =
              initializeOnBoardingList(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        onPressed: () {
          final cubit = BlocProvider.of<OnBoardingCubit>(context);
          cubit.onPageChanged(cubit.state.index + 1);
          if (cubit.state.index > onBoardingList.length - 1) {
            sharedPreferences?.setString("onboarding", "1");
            context.pushPage(route: AppRouter.login);
          } else {
            cubit.pageController.animateToPage(
              cubit.state.index,
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOut,
            );
          }
        },
        color: AppColor.primarycolor,
        textColor: Colors.white,
        child: Text(S.of(context).onboardingcustombutton),
      ),
    );
  }
}
