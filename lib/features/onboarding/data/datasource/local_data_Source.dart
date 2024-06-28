// ignore_for_file: file_names

import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../entities/onboardingmodel.dart';

List<OnBoardingModel> initializeOnBoardingList(BuildContext context) {
  return [
    OnBoardingModel(
      title: S.of(context).onboardingtitle1,
      body: S.of(context).onboardingcontent1,
      image: AppImageAsset.onBoardingImageOne,
    ),
    OnBoardingModel(
      title: S.of(context).onboardingtitle2,
      body: S.of(context).onboardingcontent2,
      image: AppImageAsset.onBoardingImageTwo,
    ),
    OnBoardingModel(
      title: S.of(context).onboardingtitle3,
      body: S.of(context).onboardingcontent3,
      image: AppImageAsset.onBoardingImageThree,
    ),
  ];
}
