import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/imageassets.dart';
import '../../../manager/checkout_cubit/checkout_cubit.dart';
import 'card_delivery_type.dart';
import 'shipping_address_bloc_builder.dart';

class ChooseDeliveryMethods extends StatefulWidget {
  const ChooseDeliveryMethods({super.key});

  @override
  State<ChooseDeliveryMethods> createState() => _ChooseDeliveryMethodsState();
}

class _ChooseDeliveryMethodsState extends State<ChooseDeliveryMethods> {
  @override
  Widget build(BuildContext context) {
    CheckoutCubit checkoutBuilder = BlocProvider.of<CheckoutCubit>(context);

    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                checkoutBuilder.deliveryType = "delivery";
                setState(() {});
              },
              child: CardDeliveryType(
                title: "Delivery",
                image: AppImageAsset.deliveryImage,
                isActive: checkoutBuilder.deliveryType == "delivery",
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                checkoutBuilder.deliveryType = "drive";
                setState(() {});
              },
              child: CardDeliveryType(
                title: "Recive",
                image: AppImageAsset.deriveThuImage,
                isActive: checkoutBuilder.deliveryType == "drive",
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        BlocProvider.of<CheckoutCubit>(context).deliveryType == "delivery"
            ? const ShippingAddressBlocBuilder()
            : Container(),
      ],
    );
  }
}
