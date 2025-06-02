import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../../../../core/shared/features/entities/category.dart';
import '../repositories/category_repository.dart';

class FetchCategoriesUseCase implements UseCase<List<Category>, NoParams> {
  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await getIt<CategoryRepository>().fetchCategories;
  }
}
