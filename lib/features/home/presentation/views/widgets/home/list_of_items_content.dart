import 'package:flutter/material.dart';

import '../../../../data/models/item_model.dart';
import 'custom_home_item_card.dart';

class ListOfItemsContent extends StatelessWidget {
  final List<ItemModel> items;
  const ListOfItemsContent({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 10),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomHomeItemCard(itemModel: items[index]);
        },
      ),
    );
  }
}
