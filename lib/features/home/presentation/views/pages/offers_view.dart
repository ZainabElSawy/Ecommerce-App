import 'package:ecommerce_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/imageassets.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/home/custom_home_app_bar.dart';
import '../widgets/items/custom_item_card.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context).fetchOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
              if (state is SearchSuccess) {
                if (state.items!.isEmpty) {
                  return Center(
                    child: Lottie.asset(AppImageAsset.noData),
                  );
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.items!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomItemCard(
                      itemModel: state.items![index],
                    );
                  },
                );
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
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
