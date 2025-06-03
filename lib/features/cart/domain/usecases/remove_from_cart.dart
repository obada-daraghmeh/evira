import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../repositories/cart_repository.dart';

class RemoveFromCartUseCase implements UseCase<Unit, String> {
  @override
  Future<Either<Failure, Unit>> call(String id) async {
    return await getIt<CartRepository>().removeFromCart(id: id);
  }
}
