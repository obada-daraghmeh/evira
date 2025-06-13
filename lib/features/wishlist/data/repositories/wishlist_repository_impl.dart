import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../datasources/wishlist_remote_data_source.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final _remoteDataSource = getIt<WishlistRemoteDataSource>();

  @override
  Future<Either<Failure, Unit>> addToWishlist(String productId) async {
    try {
      await _remoteDataSource.addToWishlist(productId: productId);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> get fetchWishlist async {
    try {
      final response = await _remoteDataSource.fetchWishlist;
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromWishlist(String productId) async {
    try {
      await _remoteDataSource.removeFromWishlist(productId: productId);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
