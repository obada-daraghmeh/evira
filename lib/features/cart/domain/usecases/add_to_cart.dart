import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class AddToCartUseCase implements UseCase<Unit, Cart> {
  @override
  Future<Either<Failure, Unit>> call(Cart params) async {
    return await getIt<CartRepository>().addToCart(cart: params);
  }
}
