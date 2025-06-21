import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../domain/entities/brand.dart';
import '../../domain/repositories/brand_repository.dart';
import '../datasources/brand_remote_data_source.dart';

class BrandRepositoryImpl implements BrandRepository {
  final _remoteDataSource = getIt<BrandRemoteDataSource>();

  @override
  Future<Either<Failure, List<Brand>>> get fetchBrands async {
    try {
      final response = await _remoteDataSource.fetchBrands;
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
