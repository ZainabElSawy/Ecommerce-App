import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constant/linkapi.dart';
import '../../../../data/models/item_model.dart';

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
