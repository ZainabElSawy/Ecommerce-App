import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/functions/translate_data_base.dart';
import '../../../../data/models/categories_model.dart';
import 'categories.dart';

class ListOfCategoriesContent extends StatelessWidget {
  final List<CategoriesModel> categories;
  const ListOfCategoriesContent({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            Category(
              categoryImage: categories[index].categoriesImage ?? "",
              categories: categories,
              selectedCategory: index,
            ),
            Text(
              translateDatabase(
                categories[index].categoriesNameAr,
                categories[index].categoriesName,
              ),
              style: const TextStyle(
                fontSize: 13,
                color: AppColor.black,
              ),
            )
          ],
        ),
        itemCount: categories.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 10),
      ),
    );
  }
}
