import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/imageassets.dart';
import '../../../../../core/constant/routes.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        GoRouter.of(context).push(AppRouter.welcome);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Positioned(
            top: -45.h,
            right: -45.w,
            child: Container(
              width: 160.w,
              height: 160.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -65.h,
            left: -115.w,
            child: Container(
              width: 250.w,
              height: 250.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              AppImageAsset.imagesLogoLogo,
              width: 210.w,
            ),
          ),
        ],
      ),
    );
  }
}
