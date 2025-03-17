import 'package:flutter/material.dart';

import '../../../../data/model/order_model.dart';
import 'order_card.dart';

class OrdersListView extends StatelessWidget {
  final List<OrderModel> orders;
  const OrdersListView({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => OrderCard(orderModel: orders[index]),
      itemCount: orders.length,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 10),
    );
  }
}
