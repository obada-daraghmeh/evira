import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileAvatarUseCase
    implements UseCase<String, UpdateProfileAvatarParams> {
  @override
  Future<Either<Failure, String>> call(UpdateProfileAvatarParams params) async {
    return await getIt<ProfileRepository>().updateProfileAvatar(
      userId: params.userId,
      file: params.file,
    );
  }
}

class UpdateProfileAvatarParams {
  final String userId;
  final File file;

  const UpdateProfileAvatarParams({required this.userId, required this.file});
}
