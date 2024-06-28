import 'package:ecommerce_app/features/home/data/models/my_favorite_model.dart';

import 'package:flutter/widgets.dart';

import 'custom_fav_item_card.dart';

class CustomMyFavoriteItemsGridViewContent extends StatelessWidget {
  final List<MyFavoriteModel> items;
  const CustomMyFavoriteItemsGridViewContent({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.7),
      itemBuilder: (BuildContext context, int index) {
        return CustomFavoriteItemCard(favItemModel: items[index]);
      },
    );
  }
}
