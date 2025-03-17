import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/features/home/data/models/my_favorite_model.dart';
import 'package:ecommerce_app/features/home/presentation/manager/remove_item_from_fav_cubit/remove_item_from_favorite_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/linkapi.dart';
import '../../../../../../core/constant/routes.dart';
import '../../../../../../core/functions/show_toast.dart';
import '../../../../../../core/functions/translate_data_base.dart';
import '../../../manager/my_favorite_item_cubit/my_favorite_items_cubit.dart';

class CustomFavoriteItemCard extends StatelessWidget {
  final MyFavoriteModel favItemModel;
  const CustomFavoriteItemCard({
    Key? key,
    required this.favItemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        context.pushPage(
            route: AppRouter.favProductDetails, extra: favItemModel);
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
                    tag: "${favItemModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLinks.imagesItems}/${favItemModel.itemsImage}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translateDatabase(
                        favItemModel.itemsNameAr, favItemModel.itemsName),
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
                            "${favItemModel.itemsPriceDiscount} \$",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColor.primarycolor,
                              fontFamily: "sans",
                            ),
                          ),
                          const SizedBox(width: 5),
                          (favItemModel.itemsDiscount != 0)
                              ? Text(
                                  "${favItemModel.itemsPrice} \$",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: AppColor.grey,
                                    fontFamily: "sans",
                                    decoration: TextDecoration
                                        .lineThrough, // إضافة الخط على النص
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<RemoveItemFromFavoriteCubit>(context)
                              .removeItemFromFavorite(
                                  favId: favItemModel.favoriteId!);
                          BlocProvider.of<MyFavoriteItemsCubit>(context)
                              .fetchMyFavoriteItems();
                          showToastWidget(msg: "Removed from favorite");
                        },
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: AppColor.primarycolor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            favItemModel.itemsDiscount != 0
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
