import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class GetCartItemsUseCase implements UseCase<List<Cart>, String> {
  @override
  Future<Either<Failure, List<Cart>>> call(String userId) async {
    return await getIt<CartRepository>().getCartItems(userId: userId);
  }
}
