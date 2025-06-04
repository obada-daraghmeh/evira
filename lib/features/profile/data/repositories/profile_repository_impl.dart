import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/entities/user.dart';
import '../../domain/entities/menu_option.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';
import '../datasources/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  List<MenuOption> get profileMenuOptions =>
      getIt<ProfileLocalDataSource>().profileMenuOptions;

  @override
  List<MenuOption> get settingMenuOptions =>
      getIt<ProfileLocalDataSource>().settingMenuOptions;

  @override
  Future<Either<Failure, User>> updateProfile({
    required String username,
  }) async {
    try {
      final response = await getIt<ProfileRemoteDataSource>().updateProfile(
        username: username,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfileAvatar({
    required String userId,
    required File file,
  }) async {
    try {
      final response = await getIt<ProfileRemoteDataSource>()
          .updateProfileAvatar(userId: userId, file: file);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
