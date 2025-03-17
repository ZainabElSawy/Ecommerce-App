import 'package:ecommerce_app/features/cart/presentation/views/widgets/check_out/card_shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../address/data/models/address_model.dart';
import '../../../manager/checkout_cubit/checkout_cubit.dart';

class CustomShippingAddressListView extends StatefulWidget {
  const CustomShippingAddressListView({super.key, required this.addresses});
  final List<AddressModel> addresses;
  @override
  State<CustomShippingAddressListView> createState() =>
      _CustomShippingAddressListViewState();
}

class _CustomShippingAddressListViewState
    extends State<CustomShippingAddressListView> {
  @override
  Widget build(BuildContext context) {
        CheckoutCubit checkoutBuilder = BlocProvider.of<CheckoutCubit>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.addresses.length,
        itemBuilder: (ctx, index) => InkWell(
          onTap: () {
            checkoutBuilder.addressId=widget.addresses[index].addressId??0;
            checkoutBuilder.selectedIndex = index;
            setState(() {});
          },
          child: CardShippingAddress(
            title: widget.addresses[index].addressName!,
            subTitle:
                "${widget.addresses[index].addressCity} ${widget.addresses[index].addressStreet}",
            isActive: index == checkoutBuilder.selectedIndex,
          ),
        ),
      ),
    );
  }
}