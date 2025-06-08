import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Either<Failure, List<Product>>> searchByTitle({
    required String title,
  }) async {
    try {
      final response = await getIt<SearchRemoteDataSource>().searchByTitle(
        title: title,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> get suggestions async {
    try {
      final response = await getIt<SearchRemoteDataSource>().suggestions;
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
