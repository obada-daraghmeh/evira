import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../../../../core/shared/features/entities/user.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileUseCase implements UseCase<User, String> {
  @override
  Future<Either<Failure, User>> call(String params) async {
    return await getIt<ProfileRepository>().updateProfile(username: params);
  }
}
