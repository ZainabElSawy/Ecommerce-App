import 'package:flutter/material.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/favorite_items/custom_fav_items_gridview.dart';
import '../widgets/home/custom_home_app_bar.dart';

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
                searchTitle: S.of(context).findproduct,
                onNotificationPressed: () {},
                onFavoritePressed: () =>
                    context.pushPage(route: AppRouter.favorite),
                onSearchPressed: () {},
              ),
            ),
            const SizedBox(height: 10),
            const CustomMyFavoriteItemsGridView()
          ],
        ),
      ),
    );
  }
}
