import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../repositories/auth_repository.dart';

class SignOutUseCase implements UseCase<bool, NoParams> {
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await getIt<AuthRepository>().signOut;
  }
}
