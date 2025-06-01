import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../../../../core/shared/features/entities/user.dart';
import '../repositories/auth_repository.dart';

class CurrentUserUseCase implements UseCase<User?, NoParams> {
  @override
  Future<Either<Failure, User?>> call(NoParams params) async {
    return await getIt<AuthRepository>().currentUser;
  }
}
