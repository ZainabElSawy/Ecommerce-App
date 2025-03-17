import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constant/imageassets.dart';
import '../../../../../../core/shared/failure_widget.dart';
import '../../../../../address/presentation/manager/view_address_cubit/view_address_cubit.dart';
import 'custom_shipping_address_list_view.dart';
import 'custom_checkout_title_widget.dart';

class ShippingAddressBlocBuilder extends StatefulWidget {
  const ShippingAddressBlocBuilder({super.key});

  @override
  State<ShippingAddressBlocBuilder> createState() =>
      _ShippingAddressBlocBuilderState();
}

class _ShippingAddressBlocBuilderState
    extends State<ShippingAddressBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAddressCubit, ViewAddressState>(
      builder: (context, state) {
        if (state is ViewAddressSuccess) {
          if (state.addresses.isEmpty) {
            context.read<ViewAddressCubit>().isAddressesNotEmpty = false;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Please Add Shipping Address"),
                TextButton(
                  onPressed: () =>
                      context.pushPage(route: AppRouter.addressesAdd),
                  child: const Text(
                    "Click Here",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          }
          context.read<ViewAddressCubit>().isAddressesNotEmpty = true;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomCheckoutTitle(title: "Shipping Address"),
              CustomShippingAddressListView(addresses: state.addresses),
            ],
          );
        } else if (state is ViewAddressLoading) {
          return Center(
            child: Lottie.asset(
              AppImageAsset.loading,
              width: 300,
              height: 300,
            ),
          );
        } else if (state is ViewAddressNetworkFailure) {
          return FailureWidget(
            onPressed: fetchAddressMethod,
            image: AppImageAsset.internet,
          );
        } else if (state is ViewAddressServerFailure) {
          return FailureWidget(
            onPressed: fetchAddressMethod,
            image: AppImageAsset.server,
          );
        } else {
          return Container();
        }
      },
    );
  }

  fetchAddressMethod() {
    BlocProvider.of<ViewAddressCubit>(context).fetchAddress();
  }
}
