import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/functions/translate_data_base.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/models/item_model.dart';
import '../widgets/product_details/custom_add_to_cart_button.dart';
import '../widgets/product_details/custom_product_page_details_body.dart';
import '../widgets/product_details/custom_product_page_details_title.dart';
import '../widgets/product_details/price_and_quantity.dart';
import '../widgets/product_details/subitems_list.dart';
import '../widgets/product_details/top_product_image.dart';

class ProductDetails extends StatelessWidget {
  final ItemModel itemModel;
  const ProductDetails({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAddToCartButton(
        text: S.of(context).gotocart,
        onPressed: () {
          context.pushPage(route: AppRouter.cart);
        },
      ),
      body: ListView(children: [
        TopProductImage(
          itemImage: itemModel.itemsImage!,
          itemId: itemModel.itemsId!,
        ),
        const SizedBox(height: 100),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomProductPageDetailsTitle(
                text: translateDatabase(
                    itemModel.itemsNameAr, itemModel.itemsName),
              ),
              const SizedBox(height: 10),
              PriceAndQuantity(
                price: itemModel.itemsPrice ?? 0,
                itemId: itemModel.itemsId!,
              ),
              const SizedBox(height: 10),
              CustomProductPageDetailsBody(
                text:
                    "${translateDatabase(itemModel.itemsDescAr, itemModel.itemsDesc)}",
              ),
              const SizedBox(height: 20),
              const CustomProductPageDetailsTitle(text: "Color"),
              const SizedBox(height: 10),
              SubitemsList(subitems: subitems)
            ],
          ),
        )
      ]),
    );
  }
}

List subitems = [
  {"name": "Red", "id": 1, "active": "1"},
  {"name": "Black", "id": 2, "active": "0"},
  {"name": "Grey", "id": 3, "active": "0"},
];
