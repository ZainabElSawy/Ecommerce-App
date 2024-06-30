import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/linkapi.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/constant/imageassets.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/item_model.dart';
import '../../manager/search_cubit/search_cubit.dart';
import '../widgets/home/custom_home_app_bar.dart';
import '../widgets/home/custom_offer_card.dart';
import '../widgets/home/custom_title_home.dart';
import '../widgets/home/list_of_categories.dart';
import '../widgets/home/list_of_items.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CustomAppBar(
              textEditingController:
                  BlocProvider.of<SearchCubit>(context).textEditingController,
              onChanged: (srchText) =>
                  BlocProvider.of<SearchCubit>(context).fetchSearch(srchText),
              searchTitle: S.of(context).findproduct,
              onFavoritePressed: () =>
                  context.pushPage(route: AppRouter.favorite),
            ),
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
                return Center(child: Lottie.asset(AppImageAsset.loading));
              } else if (state is SearchNetworkFailure) {
                return Center(child: Lottie.asset(AppImageAsset.internet));
              } else if (state is SearchServerFailure) {
                return Center(child: Lottie.asset(AppImageAsset.server));
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomOfferCard(
                      title: S.of(context).asummersurprise,
                      subTitle: S.of(context).cashback,
                    ),
                    const ListOfCategories(),
                    CustomTitleHome(title: S.of(context).productforyou),
                    const ListOfItems(),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class ListItemsSearch extends StatelessWidget {
  final List<ItemModel> itemsModel;
  const ListItemsSearch({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) => InkWell(
        onTap: () {
          context.pushPage(
              route: AppRouter.productDetails, extra: itemsModel[index]);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Card(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Hero(
                    tag: "${itemsModel[index].itemsId}",
                    child: CachedNetworkImage(
                      height: 90,
                      imageUrl:
                          "${AppLinks.imagesItems}/${itemsModel[index].itemsImage}",
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(itemsModel[index].itemsName ?? ""),
                    subtitle: Text(itemsModel[index].categoriesName ?? ""),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
      itemCount: itemsModel.length,
    );
  }
}
