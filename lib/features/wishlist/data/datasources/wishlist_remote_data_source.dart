import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/backend_const.dart';
import '../../../../core/errors/exceptions/exception.dart';

final logger = Logger();

abstract class WishlistRemoteDataSource {
  Future<List<String>> get fetchWishlist;
  Future<Unit> addToWishlist({required String productId});
  Future<Unit> removeFromWishlist({required String productId});
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final SupabaseClient _client;
  const WishlistRemoteDataSourceImpl(this._client);

  String get _userId => _client.auth.currentUser!.id;

  @override
  Future<Unit> addToWishlist({required String productId}) async {
    try {
      await _client.from(BackendConst.wishlist).insert({
        'user_id': _userId,
        'product_id': productId,
      });

      return unit;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in addToWishlist(productId: $productId)',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<String>> get fetchWishlist async {
    try {
      final response = await _client
          .from(BackendConst.wishlist)
          .select('product_id')
          .eq('user_id', _userId)
          .order('created_at', ascending: false);

      return response.map((json) => json['product_id'] as String).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in fetchWishlist',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Unit> removeFromWishlist({required String productId}) async {
    try {
      await _client
          .from(BackendConst.wishlist)
          .delete()
          .eq('user_id', _userId)
          .eq('product_id', productId);
      return unit;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in removeFromWishlist(productId: $productId)',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }
}
