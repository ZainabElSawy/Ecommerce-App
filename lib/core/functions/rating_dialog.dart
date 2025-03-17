// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../features/orders/presentation/manager/order_cubit/pending_orders_cubit.dart';
import '../../features/orders/presentation/manager/update_rating_cubit/update_rating_cubit.dart';
import '../constant/color.dart';

void showDialogRating(BuildContext context, {required int orderId}) {
  final dialog = RatingDialog(
    initialRating: 1.0,
    title: const Text(
      'Rating Dialog',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    message: const Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    image: Image.asset(
      AppImageAsset.logo,
      width: 100,
      height: 100,
    ),
    submitButtonText: 'Submit',
    submitButtonTextStyle: const TextStyle(
      color: AppColor.primarycolor,
      fontWeight: FontWeight.bold,
    ),
    commentHint: 'Set your custom comment hint',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      final cubit = BlocProvider.of<UpdateRatingCubit>(context);
      cubit.updateOrdersRating(
          orderId: orderId,
          rating: response.rating.round(),
          comment: response.comment);
      BlocProvider.of<OrdersCubit>(context).fetchArchivedOrders();
    },
  );

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => dialog,
  );
}
