import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/rating_dialog.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/delete_order_cubit/delete_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/functions/print_order_status.dart';
import '../../../../data/model/order_model.dart';
import 'package:jiffy/jiffy.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${orderModel.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(orderModel.ordersDatetime.toString(),
                          pattern: "yyyy-MM-dd HH:mm:ss")
                      .fromNow(),
                  style: const TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 20),
            Text(
                'Order Type : ${orderModel.ordersType == 0 ? 'Delivery' : 'Receiving'}'),
            Text('Order Price : ${orderModel.ordersPrice} \$'),
            Text('Delivery Price :  ${orderModel.ordersPricedelivery} \$'),
            Text(
                'Payment Method : ${orderModel.ordersPaymentmethod == 0 ? 'Cash On Delivery' : 'Payment Card'}'),
            Text(
                'Order Status : ${printOrderStatus(orderModel.ordersStatus!)}'),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${orderModel.ordersTotalprice} \$",
                  style: const TextStyle(
                    color: AppColor.primarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                orderModel.ordersStatus == 0
                    ? MaterialButton(
                        onPressed: () {
                          BlocProvider.of<DeleteOrderCubit>(context)
                              .deleteOrder(orderId: orderModel.ordersId!);
                        },
                        color: AppColor.thirdcolor,
                        textColor: AppColor.secondarycolor,
                        child: const Text("Delete"),
                      )
                    : const SizedBox(),
                const SizedBox(width: 10),
                MaterialButton(
                  onPressed: () {
                    context.pushPage(
                        route: AppRouter.orderDetails, extra: orderModel);
                  },
                  color: AppColor.thirdcolor,
                  textColor: AppColor.secondarycolor,
                  child: const Text("Details"),
                ),
                const SizedBox(width: 10),
                orderModel.ordersStatus == 4 && orderModel.ordersRating == 0
                    ? MaterialButton(
                        onPressed: () {
                          showDialogRating(context,
                              orderId: orderModel.ordersId!);
                        },
                        color: AppColor.thirdcolor,
                        textColor: AppColor.secondarycolor,
                        child: const Text("Rating"),
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
