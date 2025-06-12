import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../repositories/search_repository.dart';

class AddToHistoryUseCase implements UseCase<Unit, String> {
  @override
  Future<Either<Failure, Unit>> call(String title) async {
    await getIt<SearchRepository>().addToHistory(title: title);
    return Right(unit);
  }
}
