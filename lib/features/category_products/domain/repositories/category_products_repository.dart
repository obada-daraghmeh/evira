import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/shared/features/entities/product.dart';

abstract class CategoryProductsRepository {
  Future<Either<Failure, List<Product>>> productsByCategory({
    required String categoryId,
  });
}
