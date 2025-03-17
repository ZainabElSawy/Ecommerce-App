import 'dart:developer';

import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/show_snack_bar.dart';
import 'package:ecommerce_app/core/functions/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/shared/failure_widget.dart';
import '../../manager/checkout_cubit/checkout_cubit.dart';
import '../../manager/coupon_cubit/coupon_cubit.dart';
import '../widgets/check_out/checkout_body.dart';

class Checkout extends StatefulWidget {
  const Checkout(
      {super.key,
      required this.couponId,
      required this.totalPrice,
      required this.couponDiscount});
  final int couponId;
  final int totalPrice;
  final int couponDiscount;
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            CheckoutCubit checkoutBuilder =
                BlocProvider.of<CheckoutCubit>(context);
            BlocProvider.of<CouponCubit>(context).couponName = null;
            showToastWidget(msg: "The order was added successfully");
            checkoutBuilder.paymentType = "cash";
            checkoutBuilder.deliveryType = "delivery";
            checkoutBuilder.addressId = 2;
            checkoutBuilder.selectedIndex = 0;
            context.pushPage(route: AppRouter.home);
          } else if (state is CheckoutFailure) {
            showSnackBar(context,
                msg: "Something went wrong, please try again!");
          }
        },
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(
              child: Lottie.asset(
                AppImageAsset.loading,
                width: 300,
                height: 300,
              ),
            );
          } else if (state is CheckoutNetworkFailure) {
            return FailureWidget(
              onPressed: checkoutMethod,
              image: AppImageAsset.internet,
            );
          } else if (state is CheckoutServerFailure) {
            log(state.errMessage.toString());
            return FailureWidget(
              onPressed: checkoutMethod,
              image: AppImageAsset.server,
            );
          } else {
            return CheckoutBody(
              couponId: widget.couponId,
              totalPrice: widget.totalPrice,
              couponDiscount: widget.couponDiscount,
            );
          }
        },
      ),
    );
  }

  checkoutMethod() {
    CheckoutCubit checkoutBuilder = BlocProvider.of<CheckoutCubit>(context);
    checkoutBuilder.checkout(
      couponDiscount: widget.couponDiscount,
      addressid: checkoutBuilder.addressId,
      orderstype: checkoutBuilder.deliveryType == "delivery" ? 0 : 1,
      pricedelivery: 10,
      ordersprice: widget.totalPrice,
      couponid: widget.couponId,
      paymentmethod: checkoutBuilder.paymentType == "cash" ? 0 : 1,
    );
  }
}
