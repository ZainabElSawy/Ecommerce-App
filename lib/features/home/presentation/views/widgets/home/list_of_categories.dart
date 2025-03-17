import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';

import '../../../../../../core/constant/color.dart';
import 'list_of_categories_content.dart';

class ListOfCategories extends StatelessWidget {
  const ListOfCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: CircularProgressIndicator(color: AppColor.primarycolor)),
          );
        } else if (state is CategoriesNetworkFailure) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Icon(Icons.wifi_off)),
          );
        } else if (state is CategoriesServerFailure) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Icon(Icons.error, color: Colors.red)),
          );
        } else if (state is CategoriesSuccess) {
          return ListOfCategoriesContent(categories: state.categories);
        } else {
          return Container();
        }
      },
    );
  }
}
