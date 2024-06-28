import 'package:ecommerce_app/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/item_model.dart';
import 'custom_item_card.dart';

class CustomItemsGridViewContent extends StatelessWidget {
  final List<ItemModel> items;
  const CustomItemsGridViewContent({
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
        BlocProvider.of<FavoriteCubit>(context).setFavorite(
          items[index].itemsId,
          items[index].favorite,
        );
        return CustomItemCard(itemModel: items[index]);
      },
    );
  }
}
