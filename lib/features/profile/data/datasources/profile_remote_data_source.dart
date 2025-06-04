import 'dart:io';

import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/supabase_const.dart';
import '../../../../core/errors/exceptions/exception.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/shared/features/models/user_model.dart';

final logger = Logger();

abstract class ProfileRemoteDataSource {
  Future<UserModel> updateProfile({required String username});
  Future<String> updateProfileAvatar({
    required String userId,
    required File file,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient _client;
  const ProfileRemoteDataSourceImpl(this._client);

  @override
  Future<UserModel> updateProfile({required String username}) async {
    try {
      final user = _client.auth.currentUser;
      if (user == null) throw Exception('No authenticated user');

      final response = await _client
          .from(SupabaseConst.profiles)
          .update({'username': username})
          .eq('id', user.id)
          .select()
          .single();

      return UserModel.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in updateProfile(username: $username)',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(FlutterIntl.current.unknownErrorMessage);
    }
  }

  @override
  Future<String> updateProfileAvatar({
    required String userId,
    required File file,
  }) async {
    try {
      final fileExt = file.path.split('.').last;
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filePath = '${userId}_$timestamp.$fileExt';

      await _client.storage
          .from(SupabaseConst.avatarsBucket)
          .upload(filePath, file, fileOptions: const FileOptions(upsert: true));

      final url = _client.storage
          .from(SupabaseConst.avatarsBucket)
          .getPublicUrl(filePath);

      await _client
          .from(SupabaseConst.profiles)
          .update({'avatar_url': url})
          .eq('id', userId);

      return url;
    } on StorageException catch (e) {
      throw ServerException(e.message);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in updateProfileAvatar(userId: $userId)',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(FlutterIntl.current.unknownErrorMessage);
    }
  }
}
