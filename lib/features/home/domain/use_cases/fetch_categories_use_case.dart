import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';

import '../../../../core/class/use_cases/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../repos/home_repo.dart';

class FetchCategoriesUseCase extends UseCase<List<CategoriesModel>, NoParam> {
  final HomeRepo homeRepo;
  FetchCategoriesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<CategoriesModel>>> call([NoParam? param]) async {
    return await homeRepo.fetchCategories();
  }
}