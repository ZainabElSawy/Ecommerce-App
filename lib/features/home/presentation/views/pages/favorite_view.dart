import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/imageassets.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/search_cubit/search_cubit.dart';
import '../widgets/favorite_items/custom_fav_items_gridview.dart';
import '../widgets/home/custom_home_app_bar.dart';
import '../widgets/home/list_items_search.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomAppBar(
                  onChanged: (srchText) => BlocProvider.of<SearchCubit>(context)
                      .fetchSearch(srchText),
                  textEditingController: BlocProvider.of<SearchCubit>(context)
                      .textEditingController,
                  searchTitle: S.of(context).findproduct,
                  onFavoritePressed: () =>
                      context.pushPage(route: AppRouter.favorite),
                )),
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
                  return Center(child: Lottie.asset(AppImageAsset.loading));
                } else if (state is SearchNetworkFailure) {
                  return Center(child: Lottie.asset(AppImageAsset.internet));
                } else if (state is SearchServerFailure) {
                  return Center(child: Lottie.asset(AppImageAsset.server));
                } else {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      CustomMyFavoriteItemsGridView()
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
