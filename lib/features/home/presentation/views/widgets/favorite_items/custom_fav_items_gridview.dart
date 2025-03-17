import 'dart:developer';

import 'package:ecommerce_app/features/home/presentation/manager/my_favorite_item_cubit/my_favorite_items_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/imageassets.dart';
import 'custom_fav_items_gridview_content.dart';

class CustomMyFavoriteItemsGridView extends StatelessWidget {
  const CustomMyFavoriteItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFavoriteItemsCubit, MyFavoriteItemsState>(
      builder: (context, state) {
        if (state is MyFavoriteItemsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.primarycolor),
          );
        } else if (state is MyFavoriteItemsNetworkFailure) {
          return Center(child: Lottie.asset(AppImageAsset.internet));
        } else if (state is MyFavoriteItemsServerFailure) {
          log(state.errMessage.toString());
          return Center(child: Lottie.asset(AppImageAsset.server));
        } else if (state is MyFavoriteItemsSuccess) {
          if (state.favItem.isEmpty) {
            return Center(child: Lottie.asset(AppImageAsset.noData));
          } else {
            return CustomMyFavoriteItemsGridViewContent(items: state.favItem);
          }
        } else {
          return Container();
        }
      },
    );
  }
}
