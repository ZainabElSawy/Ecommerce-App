import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/imageassets.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/categories_model.dart';
import '../../manager/search_cubit/search_cubit.dart';
import '../widgets/home/custom_home_app_bar.dart';

import '../widgets/home/list_items_search.dart';
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
            CustomAppBar(
              onChanged: (srchText) =>
                  BlocProvider.of<SearchCubit>(context).fetchSearch(srchText),
              textEditingController:
                  BlocProvider.of<SearchCubit>(context).textEditingController,
              searchTitle: S.of(context).findproduct,
              onFavoritePressed: () =>
                  context.pushPage(route: AppRouter.favorite),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess &&
                    BlocProvider.of<SearchCubit>(context)
                            .textEditingController
                            .text !=
                        '') {
                  if (state.items!.isNotEmpty) {
                    return ListItemsSearch(itemsModel: state.items!);
                  }
                  return Center(child: Lottie.asset(AppImageAsset.noData));
                } else if (state is SearchLoading) {
                  return Center(
                    child: Lottie.asset(
                      AppImageAsset.loading,
                      width: 300,
                      height: 300,
                    ),
                  );
                } else if (state is SearchNetworkFailure) {
                  return Center(child: Lottie.asset(AppImageAsset.internet));
                } else if (state is SearchServerFailure) {
                  return Center(child: Lottie.asset(AppImageAsset.server));
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      ListOfCategoriesItems(categories: categories),
                      const CustomItemsGridView()
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
