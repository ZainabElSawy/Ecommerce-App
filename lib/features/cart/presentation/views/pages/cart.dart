import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/constant/imageassets.dart';

import '../widgets/cart/cart_appbar.dart';
import '../widgets/cart/custom_bottom_navigation_bar_cart.dart';
import '../widgets/cart/custom_items_cart.dart';
import '../widgets/cart/top_card_cart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const CartAppBar(title: "Cart"),
            const SizedBox(height: 10),
            const TopCardCart(text: "You Have 2 Items in Your List"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Column(
                children: [
                  CustomitemsCart(
                    image: AppImageAsset.logo,
                    name: "Macbook M2 Max",
                    price: '300.00 \$',
                    count: "5",
                  ),
                  CustomitemsCart(
                    image: AppImageAsset.logo,
                    name: "Macbook M2 Max",
                    price: '1500.00 \$',
                    count: "1",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomButtomNavigationbarCart(
        price: "1200 \$",
        shipping: "1200 \$",
        totalPrice: "1200 \$",
      ),
    );
  }
}
