import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/imageassets.dart';
import '../../../../address/presentation/view/widgets/custom_loading_widget.dart';
import '../../manager/order_cubit/pending_orders_cubit.dart';
import '../widgets/pending_archive/orders_listview.dart';

class OrdersArchive extends StatefulWidget {
  const OrdersArchive({super.key});

  @override
  State<OrdersArchive> createState() => _OrdersArchiveState();
}

class _OrdersArchiveState extends State<OrdersArchive> {
  @override
  void initState() {
    BlocProvider.of<OrdersCubit>(context).fetchArchivedOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<OrdersCubit, PendingOrdersState>(
          builder: (context, state) {
            if (state is PendingOrdersSuccess) {
              if (state.orders!.isEmpty) {
                return Center(child: Lottie.asset(AppImageAsset.noData));
              } else {
                return OrdersListView(orders: state.orders!);
              }
            } else if (state is PendingOrdersLoading) {
              return const CustomLoadingWidget();
            } else if (state is PendingOrdersNetworkFailure) {
              return Center(child: Lottie.asset(AppImageAsset.internet));
            } else if (state is PendingOrdersServerFailure) {
              log(state.errMessage.toString());

              return Center(child: Lottie.asset(AppImageAsset.server));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
