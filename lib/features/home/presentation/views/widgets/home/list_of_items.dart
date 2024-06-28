import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/color.dart';
import '../../../manager/items_cubit/items_cubit.dart';
import 'list_of_items_content.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsCubit, ItemsState>(
      builder: (context, state) {
        if (state is ItemsLoading) {
          return const Center(
              child: CircularProgressIndicator(color: AppColor.primarycolor));
        } else if (state is ItemsNetworkFailure) {
          return const Center(child: Icon(Icons.wifi_off));
        } else if (state is ItemsServerFailure) {
          return const Center(child: Icon(Icons.error, color: Colors.red));
        } else if (state is ItemsSuccess) {
          return ListOfItemsContent(items: state.items);
        } else {
          return Container();
        }
      },
    );
  }
}

