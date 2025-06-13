import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../domain/repositories/category_products_repository.dart';
import '../datasources/category_products_remote_data_source.dart';

class CategoryProductsRepositoryImpl implements CategoryProductsRepository {
  final _remoteDataSource = getIt<CategoryProductsRemoteDataSource>();

  @override
  Future<Either<Failure, List<Product>>> productsByCategory({
    required String categoryId,
  }) async {
    try {
      final response = await _remoteDataSource.productsByCategory(
        categoryId: categoryId,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
