import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/features/address/presentation/manager/add_delete_address_cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/imageassets.dart';
import '../../../../../core/shared/failure_widget.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/add_address_details_listview.dart';

class AddressAddDetails extends StatefulWidget {
  final double lat;
  final double long;
  const AddressAddDetails({
    Key? key,
    required this.lat,
    required this.long,
  }) : super(key: key);

  @override
  State<AddressAddDetails> createState() => _AddressAddDetailsState();
}

class _AddressAddDetailsState extends State<AddressAddDetails> {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  @override
  void initState() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name?.dispose();
    city?.dispose();
    street?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).adddetailsaddress)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocConsumer<AddressCubit, AddressState>(
          builder: (context, state) {
            if (state is AddressLoading) {
              return Center(child: Lottie.asset(AppImageAsset.loading));
            } else if (state is AddressNetworkFailure) {
              return FailureWidget(
                onPressed: addressMethod,
                image: AppImageAsset.internet,
              );
            } else if (state is AddressServerFailure) {
              return FailureWidget(
                onPressed: addressMethod,
                image: AppImageAsset.server,
              );
            } else {
              return AddAddressDetailsListView(city: city, street: street, name: name, onPressed: addressMethod,);
            }
          },
          listener: (BuildContext context, AddressState state) {
            if (state is AddressSuccess) {
              context.pushPage(route: AppRouter.home);
            }
          },
        ),
      ),
    );
  }

  void addressMethod() {
    BlocProvider.of<AddressCubit>(context).addAddress(
      name: name?.text ?? "",
      city: city?.text ?? "",
      street: street?.text ?? "",
      lat: widget.lat,
      long: widget.long,
    );
  }
}

