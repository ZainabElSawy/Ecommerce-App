import 'package:ecommerce_app/core/functions/translate_data_base.dart';
import 'package:ecommerce_app/features/home/presentation/manager/items_for_cat_cubit/items_for_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../data/models/categories_model.dart';

// ignore: must_be_immutable
class ListOfCategoriesItems extends StatefulWidget {
  final List<CategoriesModel> categories;

  const ListOfCategoriesItems({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  State<ListOfCategoriesItems> createState() => _ListOfCategoriesItemsState();
}

class _ListOfCategoriesItemsState extends State<ListOfCategoriesItems> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<ItemsForCategoryCubit>(context)
                    .fetchAllItemsData(categoryId: index + 1);
                setState(
                  () => BlocProvider.of<ItemsForCategoryCubit>(context)
                      .selectedCategory = index,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                    border: BlocProvider.of<ItemsForCategoryCubit>(context)
                                .selectedCategory ==
                            index
                        ? const Border(
                            bottom: BorderSide(
                              width: 3,
                              color: AppColor.primarycolor,
                            ),
                          )
                        : null),
                child: Text(
                  translateDatabase(widget.categories[index].categoriesNameAr,
                      widget.categories[index].categoriesName),
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.darkGrey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        itemCount: widget.categories.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 15),
      ),
    );
  }
}
