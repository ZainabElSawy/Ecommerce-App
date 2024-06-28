import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/imageassets.dart';
import '../../../manager/items_for_cat_cubit/items_for_category_cubit.dart';
import 'cutom_items_grid_view_content.dart';

class CustomItemsGridView extends StatelessWidget {
  const CustomItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsForCategoryCubit, ItemsForCategoryState>(
      builder: (context, state) {
        if (state is ItemsForCategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.primarycolor),
          );
        } else if (state is ItemsForCategoryNetworkFailure) {
          return Center(child: Lottie.asset(AppImageAsset.internet));
        } else if (state is ItemsForCategoryServerFailure) {
          return Center(child: Lottie.asset(AppImageAsset.server));
        } else if (state is ItemsForCategorySuccess) {
          if (state.items.isEmpty) {
            return Center(child: Lottie.asset(AppImageAsset.noData));
          } else {
            return CustomItemsGridViewContent(items: state.items);
          }
        } else {
          return Container();
        }
      },
    );
  }
}

