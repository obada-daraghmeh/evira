import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../repositories/product_repository.dart';

class FetchProductsUseCase implements UseCase<List<Product>, NoParams> {
  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await getIt<ProductRepository>().products;
  }
}
