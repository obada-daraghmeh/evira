import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../domain/entities/cart.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';
import '../models/cart_model.dart';

class CartRepositoryImpl implements CartRepository {
  @override
  Future<Either<Failure, Unit>> addToCart({required Cart cart}) async {
    try {
      await getIt<CartRemoteDataSource>().addToCart(
        cartModel: CartModel.fromEntity(cart),
      );
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getCartItems({
    required String userId,
  }) async {
    try {
      final response = await getIt<CartRemoteDataSource>().getCartItems(
        userId: userId,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromCart({required String id}) async {
    try {
      await getIt<CartRemoteDataSource>().removeFromCart(id: id);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
