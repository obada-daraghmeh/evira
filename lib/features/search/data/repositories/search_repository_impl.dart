import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_local_data_source.dart';
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
  Future<Either<Failure, List<String>>> get suggestions async {
    try {
      final response = await getIt<SearchRemoteDataSource>().suggestions;
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addToHistory({required String title}) async {
    try {
      await getIt<SearchLocalDataSource>().addToHistory(title: title);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> get clearHistory async {
    try {
      await getIt<SearchLocalDataSource>().clearHistory;
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteFromHistory({
    required String title,
  }) async {
    try {
      await getIt<SearchLocalDataSource>().deleteFromHistory(title: title);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> get fetchHistory async {
    try {
      final response = await getIt<SearchLocalDataSource>().fetchHistory;
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
