import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/shared/features/entities/product.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Product>>> searchByTitle({required String title});
  Future<Either<Failure, List<Product>>> get suggestions;
}
