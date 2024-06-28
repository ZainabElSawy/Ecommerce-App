import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
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
              searchTitle: S.of(context).findproduct,
              onNotificationPressed: () {},
              onFavoritePressed: () =>
                  context.pushPage(route: AppRouter.favorite),
              onSearchPressed: () {},
            ),
          ),
          CustomOfferCard(
            title: S.of(context).asummersurprise,
            subTitle: S.of(context).cashback,
          ),
          const ListOfCategories(),
          CustomTitleHome(title: S.of(context).productforyou),
          const ListOfItems(),
        ],
      ),
    );
  }
}
