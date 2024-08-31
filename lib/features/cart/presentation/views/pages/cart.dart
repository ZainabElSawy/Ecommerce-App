import 'package:ecommerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/shared/failure_widget.dart';
import '../widgets/cart/cart_appbar.dart';
import '../widgets/cart/custom_cart_builder.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CartAppBar(title: "Cart"),
            ),
            SliverFillRemaining(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return Center(child: Lottie.asset(AppImageAsset.loading));
                  } else if (state is CartNetworkFailure) {
                    return FailureWidget(
                      onPressed: cartMethod,
                      image: AppImageAsset.internet,
                    );
                  } else if (state is CartServerFailure) {
                    return FailureWidget(
                      onPressed: cartMethod,
                      image: AppImageAsset.server,
                    );
                  } else if (state is CartSuccess) {
                    return CustomCartBuilder(cartModel: state.cartModel);
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  cartMethod() {
    BlocProvider.of<CartCubit>(context).fetchCartView();
  }
}

