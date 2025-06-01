import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await getIt<AuthRemoteDataSource>().signIn(
        email: email,
        password: password,
      );
      return Right(response.user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await getIt<AuthRemoteDataSource>().signUp(
        username: username,
        email: email,
        password: password,
      );
      return Right(response.user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> get currentUser async {
    try {
      final response = await getIt<AuthRemoteDataSource>().currentUser;
      if (response == null) {
        return Left(ServerFailure('No user found'));
      }
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> get signOut async {
    try {
      final response = await getIt<AuthRemoteDataSource>().signOut;
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
