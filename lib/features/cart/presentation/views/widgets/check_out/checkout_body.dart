import 'package:ecommerce_app/core/functions/show_snack_bar.dart';
import 'package:ecommerce_app/features/cart/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../address/presentation/manager/view_address_cubit/view_address_cubit.dart';
import 'choose_delivery_methods_widget.dart';
import 'choose_payment_methods_widget.dart';
import 'custom_checkout_button.dart';
import 'custom_checkout_title_widget.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({
    super.key,
    required this.couponId,
    required this.totalPrice,
    required this.couponDiscount,
  });
  final int couponId;
  final int totalPrice;
  final int couponDiscount;

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  @override
  void initState() {
    //fetchAddressMethod();
    BlocProvider.of<ViewAddressCubit>(context).fetchAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      bottomNavigationBar: CustomCheckoutButton(onCheckout: checkoutMethod),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            CustomCheckoutTitle(title: "Choose Payment Method"),
            SizedBox(height: 10),
            ChoosePaymentMethodsWidget(),
            SizedBox(height: 20),
            CustomCheckoutTitle(title: "Choose Delivery Type"),
            SizedBox(height: 10),
            ChooseDeliveryMethods(),
          ],
        ),
      ),
    );
  }

  
  checkoutMethod() {
    CheckoutCubit checkoutBuilder = BlocProvider.of<CheckoutCubit>(context);
    (context.read<ViewAddressCubit>().isAddressesNotEmpty == true &&
                checkoutBuilder.deliveryType == "delivery") ||
            checkoutBuilder.deliveryType != "delivery"
        ? checkoutBuilder.checkout(
            addressid: checkoutBuilder.addressId,
            orderstype: checkoutBuilder.deliveryType == "delivery" ? 0 : 1,
            pricedelivery: 10,
            ordersprice: widget.totalPrice,
            couponid: widget.couponId,
            paymentmethod: checkoutBuilder.paymentType == "cash" ? 0 : 1,
            couponDiscount: widget.couponDiscount,
          )
        : showSnackBar(context, msg: "There is No Shipping Address Added");
  }
}
