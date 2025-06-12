import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/backend_const.dart';
import '../../../../core/errors/exceptions/exception.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/shared/features/models/user_model.dart';
import '../models/authenticated_user.dart';

final logger = Logger();

abstract class AuthRemoteDataSource {
  Session? get session;

  Future<AuthenticatedUser> signIn({
    required String email,
    required String password,
  });

  Future<AuthenticatedUser> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<UserModel?> get currentUser;

  Future<bool> get signOut;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _client;
  const AuthRemoteDataSourceImpl(this._client);

  @override
  Session? get session => _client.auth.currentSession;

  @override
  Future<AuthenticatedUser> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session == null || response.user == null) {
        throw ServerException(FlutterIntl.current.signInFailedMessage);
      }

      final currentUser = await _getCurrentUserOrThrow();

      return AuthenticatedUser(session: response.session!, user: currentUser);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in signIn(email: $email)',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(FlutterIntl.current.unknownErrorMessage);
    }
  }

  @override
  Future<AuthenticatedUser> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );

      if (response.user == null) {
        throw ServerException(FlutterIntl.current.accountCreationFailedMessage);
      }

      final currentUser = await _getCurrentUserOrThrow();

      return AuthenticatedUser(session: response.session!, user: currentUser);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in signUp(username: $username, email: $email)',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(FlutterIntl.current.unknownErrorMessage);
    }
  }

  @override
  Future<UserModel?> get currentUser async {
    try {
      final userId = session?.user.id;
      if (session == null || userId == null) {
        return null;
      }

      final response = await _client
          .from(BackendConst.profiles)
          .select()
          .eq('id', userId)
          .maybeSingle();

      if (response == null || response.isEmpty) {
        return null;
      }

      return UserModel.fromJson(
        response,
      ).copyWith(email: session?.user.email ?? '');
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in currentUser (userId: ${session?.user.id}):',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(FlutterIntl.current.unknownErrorMessage);
    }
  }

  @override
  Future<bool> get signOut async {
    try {
      await _client.auth.signOut();
      return true;
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in signOut(userId: ${session?.user.id}):',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(FlutterIntl.current.unknownErrorMessage);
    }
  }

  Future<UserModel> _getCurrentUserOrThrow() async {
    final user = await currentUser;
    if (user == null) {
      throw ServerException(FlutterIntl.current.fetchUserFailedMessage);
    }
    return user;
  }
}
