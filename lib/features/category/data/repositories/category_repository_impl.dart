import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final _remoteDataSource = getIt<CategoryRemoteDataSource>();

  @override
  Future<Either<Failure, List<Category>>> get fetchCategories async {
    try {
      final response = await _remoteDataSource.fetchCategories;
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
