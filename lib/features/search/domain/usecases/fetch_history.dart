import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../repositories/search_repository.dart';

class FetchHistoryUseCase implements UseCase<List<String>, NoParams> {
  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return await getIt<SearchRepository>().fetchHistory;
  }
}
