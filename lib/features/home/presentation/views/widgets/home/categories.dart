import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/linkapi.dart';
import '../../../../../../core/constant/routes.dart';
import '../../../../data/models/categories_model.dart';
import '../../../manager/items_for_cat_cubit/items_for_category_cubit.dart';

class Category extends StatelessWidget {
  final String categoryImage;
  final List<CategoriesModel> categories;
  final int selectedCategory;
  const Category({
    Key? key,
    required this.categoryImage,
    required this.categories,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ItemsForCategoryCubit>(context).selectedCategory =
            selectedCategory;
        BlocProvider.of<ItemsForCategoryCubit>(context)
            .fetchAllItemsData(categoryId: selectedCategory + 1);
        context.pushPage(route: AppRouter.items, extra: {
          "categories": categories,
          "selectedCategory":
              BlocProvider.of<ItemsForCategoryCubit>(context).selectedCategory,
        });
      },
      child: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.thirdcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: SvgPicture.network(
            "${AppLinks.imagesCategories}/$categoryImage",
            color: AppColor.secondarycolor,
            width: 60,
            height: 60,
          ),
        ),
      ),
    );
  }
}
