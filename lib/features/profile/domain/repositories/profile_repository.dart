import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/shared/features/entities/user.dart';
import '../entities/menu_option.dart';

abstract class ProfileRepository {
  List<MenuOption> get profileMenuOptions;
  List<MenuOption> get settingMenuOptions;

  Future<Either<Failure, User>> updateProfile({required String username});

  Future<Either<Failure, String>> updateProfileAvatar({
    required String userId,
    required File file,
  });
}
