import 'package:ecommerce_app/core/functions/show_snack_bar.dart';
import 'package:ecommerce_app/features/cart/presentation/manager/coupon_cubit/coupon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constant/imageassets.dart';
import '../../../../../../core/shared/failure_widget.dart';
import '../../../../data/models/cart_model.dart';
import 'custom_cart_body.dart';

class CustomCartBuilder extends StatefulWidget {
  const CustomCartBuilder({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;

  @override
  State<CustomCartBuilder> createState() => _CustomCartBuilderState();
}

class _CustomCartBuilderState extends State<CustomCartBuilder> {
  late TextEditingController controllercoupon;
  @override
  void initState() {
    controllercoupon = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllercoupon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponCubit, CouponState>(
      listener: (context, state) {
        if (state is CouponSuccess) {
          BlocProvider.of<CouponCubit>(context).couponName =
              state.couponModel.couponName;
        } else if (state is CouponFailure) {
          showSnackBar(context, msg: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is CouponSuccess) {
          if (BlocProvider.of<CouponCubit>(context).couponName == null) {
            return CustomCartBody(
              cartModel: widget.cartModel,
              controllercoupon: controllercoupon,
              discount: 0,
            );
          }
          return CustomCartBody(
            cartModel: widget.cartModel,
            controllercoupon: controllercoupon,
            discount: state.couponModel.couponDiscount ?? 0,
            couponId: state.couponModel.couponId,
          );
        } else if (state is CouponNetworkFailure) {
          return FailureWidget(
            onPressed: () {},
            image: AppImageAsset.internet,
          );
        } else if (state is CouponLoading) {
          return Center(
            child: Lottie.asset(
              AppImageAsset.loading,
              width: 300,
              height: 300,
            ),
          );
        } else if (state is CouponServerFailure) {
          return FailureWidget(
            onPressed: () {},
            image: AppImageAsset.server,
          );
        }
        return CustomCartBody(
          cartModel: widget.cartModel,
          controllercoupon: controllercoupon,
          discount: 0,
        );
      },
    );
  }
}
