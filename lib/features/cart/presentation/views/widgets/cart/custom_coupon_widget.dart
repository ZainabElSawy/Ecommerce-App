import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/color.dart';
import '../../../manager/coupon_cubit/coupon_cubit.dart';
import 'custom_coupon_row.dart';

class CustomCouponWidget extends StatelessWidget {
  const CustomCouponWidget({
    super.key,
    required this.controllercoupon,
    required this.onApplyCoupon,
  });

  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocProvider.of<CouponCubit>(context).couponName == null
          ? CustomCouponRow(controllercoupon: controllercoupon, onApplyCoupon: onApplyCoupon)
          : Text(
              "Coupon Code ${BlocProvider.of<CouponCubit>(context).couponName}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primarycolor,
              ),
            ),
    );
  }
}