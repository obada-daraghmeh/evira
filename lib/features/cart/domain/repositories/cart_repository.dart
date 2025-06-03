import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, Unit>> addToCart({required Cart cart});

  Future<Either<Failure, List<Cart>>> getCartItems({required String userId});

  Future<Either<Failure, Unit>> removeFromCart({required String id});
}
