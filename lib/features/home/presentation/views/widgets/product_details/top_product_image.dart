import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/linkapi.dart';

class TopProductImage extends StatelessWidget {
  const TopProductImage({
    Key? key,
    required this.itemId,
    required this.itemImage,
  }) : super(key: key);
  final int itemId;
  final String itemImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          color: AppColor.primarycolor,
        ),
        Positioned(
          top: 30.0,
          right: MediaQuery.of(context).size.width / 7,
          left: MediaQuery.of(context).size.width / 7,
          child: Hero(
            tag: "$itemId",
            child: CachedNetworkImage(
              imageUrl: "${AppLinks.imagesItems}/$itemImage",
              height: 250,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
