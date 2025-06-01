import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/shared/features/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, User?>> get currentUser;

  Future<Either<Failure, bool>> get signOut;
}
