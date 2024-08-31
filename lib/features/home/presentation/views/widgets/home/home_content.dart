import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import 'custom_offer_card.dart';
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
}
