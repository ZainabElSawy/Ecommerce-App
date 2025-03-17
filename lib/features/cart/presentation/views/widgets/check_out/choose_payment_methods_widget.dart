import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/checkout_cubit/checkout_cubit.dart';
import 'card_payment_method.dart';

class ChoosePaymentMethodsWidget extends StatefulWidget {
  const ChoosePaymentMethodsWidget({super.key});

  @override
  State<ChoosePaymentMethodsWidget> createState() =>
      _ChoosePaymentMethodsWidgetState();
}

class _ChoosePaymentMethodsWidgetState
    extends State<ChoosePaymentMethodsWidget> {
      
  @override
  Widget build(BuildContext context) {
        CheckoutCubit checkoutBuilder = BlocProvider.of<CheckoutCubit>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            checkoutBuilder.paymentType = "cash";
            setState(() {});
          },
          child: CardPaymentMethod(
            title: "Cash On Delivery",
            isActive: checkoutBuilder.paymentType == "cash",
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            checkoutBuilder.paymentType = "card";
            setState(() {});
          },
          child: CardPaymentMethod(
            title: "Payment Cards",
            isActive: checkoutBuilder.paymentType == "card",
          ),
        ),
      ],
    );
  }
}