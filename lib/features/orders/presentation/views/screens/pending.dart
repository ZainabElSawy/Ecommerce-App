import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/imageassets.dart';
import '../../../../address/presentation/view/widgets/custom_loading_widget.dart';
import '../../manager/delete_order_cubit/delete_order_cubit.dart';
import '../../manager/order_cubit/pending_orders_cubit.dart';
import '../widgets/pending_archive/orders_listview.dart';

class OrdersPending extends StatefulWidget {
  const OrdersPending({super.key});

  @override
  State<OrdersPending> createState() => _OrdersPendingState();
}

class _OrdersPendingState extends State<OrdersPending> {
  @override
  void initState() {
    BlocProvider.of<OrdersCubit>(context).fetchPendingOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocListener<DeleteOrderCubit, DeleteOrderState>(
          listener: (context, state) {
            if (state is DeleteOrderSuccess) {
              BlocProvider.of<OrdersCubit>(context).fetchPendingOrders();
            }
          },
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
      ),
    );
  }
}
