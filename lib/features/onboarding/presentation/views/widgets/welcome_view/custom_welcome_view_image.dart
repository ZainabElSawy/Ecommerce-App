import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/imageassets.dart';

class CustomWelcomeViewImage extends StatelessWidget {
  const CustomWelcomeViewImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -153.h,
          left: -63.w,
          child: Container(
            width: 235.w,
            height: 235.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 1.2),
            ),
          ),
        ),
        Image.asset(
          width: double.infinity,
          AppImageAsset.imagesWelcome,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
