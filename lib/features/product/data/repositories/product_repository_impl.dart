import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final _remoteDataSource = getIt<ProductRemoteDataSource>();
  @override
  Future<Either<Failure, List<Product>>> get products async {
    try {
      final response = await _remoteDataSource.products;
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> fetchProductsByIds({
    required Set<String> ids,
  }) async {
    try {
      final response = await _remoteDataSource.fetchProductsByIds(ids: ids);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
