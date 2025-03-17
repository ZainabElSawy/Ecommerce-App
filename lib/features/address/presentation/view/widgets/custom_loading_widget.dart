import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/imageassets.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(AppImageAsset.loading, width: 300, height: 300));
  }
}
