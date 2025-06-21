import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/brand.dart';

abstract class BrandRepository {
  Future<Either<Failure, List<Brand>>> get fetchBrands;
}
