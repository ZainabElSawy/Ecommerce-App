import 'package:ecommerce_app/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/linkapi.dart';
import '../../../../data/models/cart_model.dart';
import 'custom_bottom_navigation_bar_cart.dart';
import 'custom_items_cart.dart';
import 'top_card_cart.dart';

class CustomCartContent extends StatelessWidget {
  const CustomCartContent({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          TopCardCart(
              text:
                  "You Have ${cartModel.countPrice.totalCount} Items in Your List"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: cartModel.cartItems.isEmpty
                ? Container()
                : ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) => CustomitemsCart(
                      onTap: () {
                        // context.pushPage(
                        //     route: AppRouter.productDetails,
                        //     extra: cartModel.cartItems[index]);
                      },
                      onAdd: () {
                        BlocProvider.of<AddtoCartCubit>(context).addToCart(
                            itemId: cartModel.cartItems[index].itemsId);
                        BlocProvider.of<CartCubit>(context).fetchCartView();
                      },
                      onRemove: () {
                        BlocProvider.of<AddtoCartCubit>(context).removeFromCart(
                            itemId: cartModel.cartItems[index].itemsId);
                        BlocProvider.of<CartCubit>(context).fetchCartView();
                      },
                      image:
                          "${AppLinks.imagesItems}/${cartModel.cartItems[index].itemsImage}",
                      name: cartModel.cartItems[index].itemsName,
                      price: '${cartModel.cartItems[index].itemsPrice} \$',
                      count: cartModel.cartItems[index].countItems.toString(),
                    ),
                    itemCount: cartModel.cartItems.length,
                  ),
          ),
        ],
      ),
      bottomNavigationBar: CustomButtomNavigationbarCart(
        price: "${cartModel.countPrice.totalPrice} \$",
        shipping: "1200 \$",
        totalPrice: "1200 \$",
      ),
    );
  }
}
