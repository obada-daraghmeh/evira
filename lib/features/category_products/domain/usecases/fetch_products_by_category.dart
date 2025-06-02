import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../repositories/category_products_repository.dart';

class FetchProductsByCategoryUseCase implements UseCase<List<Product>, String> {
  @override
  Future<Either<Failure, List<Product>>> call(String categoryId) async {
    return await getIt<CategoryProductsRepository>().productsByCategory(
      categoryId: categoryId,
    );
  }
}
