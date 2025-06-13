import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../repositories/wishlist_repository.dart';

class AddToWishlistUseCase implements UseCase<Unit, String> {
  @override
  Future<Either<Failure, Unit>> call(String productId) async {
    return await getIt<WishlistRepository>().addToWishlist(productId);
  }
}
