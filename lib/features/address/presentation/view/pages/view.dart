import 'package:ecommerce_app/features/address/presentation/manager/add_delete_address_cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:ecommerce_app/core/constant/routes.dart';

import '../../../../../core/constant/imageassets.dart';
import '../../../../../core/shared/failure_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/address_model.dart';
import '../../manager/view_address_cubit/view_address_cubit.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  void initState() {
    BlocProvider.of<ViewAddressCubit>(context).fetchAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).address)),
      body: BlocBuilder<ViewAddressCubit, ViewAddressState>(
        builder: (context, state) {
          if (state is ViewAddressSuccess) {
            if (state.addresses.isEmpty) {
              return Center(child: Lottie.asset(AppImageAsset.noData));
            }
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: state.addresses.length,
                  itemBuilder: (ctx, index) => CardAddress(
                      addressModel: state.addresses[index],
                      onDelete: () {
                        BlocProvider.of<AddressCubit>(context).deleteAddress(
                          addressId: state.addresses[index].addressId!,
                        );
                        addressMethod();
                      })),
            );
          } else if (state is ViewAddressLoading) {
            return Center(child: Lottie.asset(AppImageAsset.loading));
          } else if (state is ViewAddressNetworkFailure) {
            return FailureWidget(
              onPressed: addressMethod,
              image: AppImageAsset.internet,
            );
          } else if (state is ViewAddressServerFailure) {
            return FailureWidget(
              onPressed: addressMethod,
              image: AppImageAsset.server,
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushPage(route: AppRouter.addressesAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void addressMethod() {
    BlocProvider.of<ViewAddressCubit>(context).fetchAddress();
  }
}

class CardAddress extends StatelessWidget {
  const CardAddress({
    Key? key,
    required this.addressModel,
    this.onDelete,
  }) : super(key: key);
  final AddressModel addressModel;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text("${addressModel.addressName}"),
          subtitle:
              Text("${addressModel.addressCity} ${addressModel.addressStreet}"),
          trailing: IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}
