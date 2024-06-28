import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/linkapi.dart';
import '../../../../../../core/constant/routes.dart';
import '../../../../../../core/functions/translate_data_base.dart';
import '../../../../data/models/item_model.dart';

class CustomHomeItemCard extends StatelessWidget {
  final ItemModel itemModel;
  const CustomHomeItemCard({
    super.key,
    required this.itemModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushPage(route: AppRouter.productDetails, extra: itemModel);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF9DEC9).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12)),
            height: 130,
            width: 200,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Hero(
              tag: "${itemModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl: "${AppLinks.imagesItems}/${itemModel.itemsImage}",
                height: 100,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF9DEC9).withOpacity(0.15),
                borderRadius: BorderRadius.circular(12)),
            height: 130,
            width: 200,
          ),
          Positioned(
              child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: AppColor.thirdcolor,
            ),
            child: Text(
              translateDatabase(
                itemModel.itemsNameAr,
                itemModel.itemsName,
              ),
              style: const TextStyle(
                color: AppColor.secondarycolor,
                fontSize: 15,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
