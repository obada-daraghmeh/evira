import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../repositories/search_repository.dart';

class SearchByTitleUseCase implements UseCase<List<Product>, String> {
  @override
  Future<Either<Failure, List<Product>>> call(String title) async {
    return await getIt<SearchRepository>().searchByTitle(title: title);
  }
}
