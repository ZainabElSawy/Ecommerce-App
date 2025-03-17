import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import 'custom_offer_card_bloc_builder.dart';
import 'custom_title_home.dart';
import 'list_of_categories.dart';
import 'list_of_items.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomOfferCardBlocBuilder(),
        const ListOfCategories(),
        CustomTitleHome(title: S.of(context).producttopselling),
        const ListOfItems(),
      ],
    );
  }
}


/*


BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeSuccess) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CustomOfferCard(
              title: state.home.settings![0].settingsTitlehome.toString(),
              subTitle: state.home.settings![0].settingsBodyhome.toString(),
            ),
            const SizedBox(height: 10),
            ListOfCategoriesContent(categories: state.home.categories!),
            const SizedBox(height: 10),
            CustomTitleHome(title: S.of(context).producttopselling),
                        const SizedBox(height: 10),

            ListOfItemsContent(items: state.home.items!),
          ],
        );
      } else if (state is HomeLoading) {
        return Center(
          child: Lottie.asset(
            AppImageAsset.loading,
            width: 300,
            height: 300,
          ),
        );
      } else if (state is HomeNetworkFailure) {
        return FailureWidget(
          onPressed: homeMethod,
          image: AppImageAsset.internet,
        );
      } else if (state is HomeServerFailure) {
        return FailureWidget(
          onPressed: homeMethod,
          image: AppImageAsset.server,
        );
      } else {
        return Container();
      }
    });
*/