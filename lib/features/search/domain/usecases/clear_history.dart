import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../repositories/search_repository.dart';

class ClearHistoryUseCase implements UseCase<Unit, NoParams> {
  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    getIt<SearchRepository>().clearHistory;
    return Right(unit);
  }
}
