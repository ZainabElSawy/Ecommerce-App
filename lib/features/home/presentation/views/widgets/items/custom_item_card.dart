import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/constant/routes.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/linkapi.dart';
import '../../../../../../core/functions/translate_data_base.dart';
import '../../../../data/models/item_model.dart';
import 'custom_favorite_button.dart';

class CustomItemCard extends StatelessWidget {
  final ItemModel itemModel;
  const CustomItemCard({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushPage(route: AppRouter.productDetails, extra: itemModel);
      },
      child: Card(
        color: AppColor.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLinks.imagesItems}/${itemModel.itemsImage}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translateDatabase(
                        itemModel.itemsNameAr, itemModel.itemsName),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Rating 3.5 "),
                      Row(children: [
                        ...List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                      ])
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${itemModel.itemsPriceDiscount} \$",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColor.primarycolor,
                              fontFamily: "sans",
                            ),
                          ),
                          const SizedBox(width: 5),
                          (itemModel.itemsDiscount != 0)
                              ? Text(
                                  "${itemModel.itemsPrice} \$",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: AppColor.grey,
                                    fontFamily: "sans",
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      CustomFavoritButton(itemId: itemModel.itemsId!),
                    ],
                  )
                ],
              ),
            ),
            itemModel.itemsDiscount != 0
                ? Positioned(
                    top: 4,
                    left: 4,
                    child: Image.asset(AppImageAsset.sale, width: 50),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
