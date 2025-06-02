import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/shared/features/entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> get fetchCategories;
}
