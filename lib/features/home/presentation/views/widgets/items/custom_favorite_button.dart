import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/custom_error_snack_bar.dart';
import '../../../../../../core/functions/show_toast.dart';
import '../../../manager/favorite_cubit/favorite_cubit.dart';

class CustomFavoritButton extends StatefulWidget {
  const CustomFavoritButton({
    super.key,
    required this.itemId,
  });

  final int itemId;

  @override
  State<CustomFavoritButton> createState() => _CustomFavoritButtonState();
}

class _CustomFavoritButtonState extends State<CustomFavoritButton> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
      listener: (BuildContext context, state) {
        if (state is FavoriteServerFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      child: IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          FavoriteCubit itemsCubit = BlocProvider.of<FavoriteCubit>(context);
          if (itemsCubit.isFavorite[widget.itemId] == 1) {
            itemsCubit.setFavorite(widget.itemId, 0);
            itemsCubit.removeFromFavorite(itemId: widget.itemId);
            showToastWidget(msg: "Removed from favorite");
            setState(() {});
          } else {
            itemsCubit.setFavorite(widget.itemId, 1);
            itemsCubit.addToFavorite(itemId: widget.itemId);
            showToastWidget(msg: "Added to favorite");

            setState(() {});
          }
        },
        icon: Icon(
          BlocProvider.of<FavoriteCubit>(context).isFavorite[widget.itemId] == 1
              ? Icons.favorite
              : Icons.favorite_border_outlined,
          color: Colors.red,
        ),
      ),
    );
  }
}
