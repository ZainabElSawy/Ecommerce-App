import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/constant/color.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/categories_model.dart';
import '../widgets/home/custom_home_app_bar.dart';

import '../widgets/items/custom_items_grid_view.dart';
import '../widgets/items/list_of_categories_item.dart';

class Items extends StatelessWidget {
  final List<CategoriesModel> categories;
  final int selectedCategory;
  const Items({
    Key? key,
    required this.categories,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // CustomAppBar(
            //   searchTitle: S.of(context).findproduct,
            //   onNotificationPressed: () {},
            //   onFavoritePressed: () =>
            //       context.pushPage(route: AppRouter.favorite),
            //   onSearchPressed: () {},
            // ),
            const SizedBox(height: 10),
            ListOfCategoriesItems(categories: categories),
            const CustomItemsGridView()
          ],
        ),
      ),
    );
  }
}
