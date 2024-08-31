import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/linkapi.dart';
import '../../../../../home/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../../../../data/models/cart_model.dart';
import '../../../manager/cart_cubit/cart_cubit.dart';
import '../../../manager/coupon_cubit/coupon_cubit.dart';
import 'custom_bottom_navigation_bar_cart.dart';
import 'custom_items_cart.dart';
import 'top_card_cart.dart';

class CustomCartBody extends StatelessWidget {
  const CustomCartBody({
    super.key,
    required this.controllercoupon,
    required this.cartModel,
    required this.discount,
  });
  final int discount;
  final TextEditingController controllercoupon;
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
        onApplyCoupon: () {
          BlocProvider.of<CouponCubit>(context)
              .checkCoupon(couponName: controllercoupon.text);
              
          controllercoupon.clear();
        },
        controllercoupon: controllercoupon,
        price: "${cartModel.countPrice.totalPrice} \$",
        discount: "$discount %",
        shipping: "300 \$",
        totalPrice: getTotalPrice(
            price: cartModel.countPrice.totalPrice, discount: discount),
      ),
    );
  }
}

getTotalPrice({required int price, required int discount}) {
  return discount != 0
      ? "${price - ((price) * (discount / 100))} \$"
      : "${(price)} \$";
}
