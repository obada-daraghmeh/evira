import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';

abstract class WishlistRepository {
  Future<Either<Failure, List<String>>> get fetchWishlist;
  Future<Either<Failure, Unit>> addToWishlist(String productId);
  Future<Either<Failure, Unit>> removeFromWishlist(String productId);
}
