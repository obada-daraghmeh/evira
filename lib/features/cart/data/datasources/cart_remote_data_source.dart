import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/backend_const.dart';
import '../../../../core/errors/exceptions/exception.dart';
import '../models/cart_model.dart';

final logger = Logger();

abstract class CartRemoteDataSource {
  Future<Unit> addToCart({required CartModel cartModel});
  Future<Map<String, List<CartModel>>> getCartItems({required String userId});
  Future<Unit> removeFromCart({required String id});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final SupabaseClient _client;
  const CartRemoteDataSourceImpl(this._client);

  @override
  Future<Unit> addToCart({required CartModel cartModel}) async {
    try {
      // final existing =
      //     await _client.from(BackendConst.cartItems).select().match({
      //       'user_id': cartModel.userId,
      //       'product_id': cartModel.productId,
      //       'size': cartModel.size,
      //       'color': cartModel.color,
      //     }).maybeSingle();

      // if (existing != null) {
      //   final existingQty = existing['quantity'] as int;

      //   if (existingQty != cartModel.quantity) {
      //     await _client
      //         .from(BackendConst.cartItems)
      //         .update({'quantity': cartModel.quantity})
      //         .eq('id', existing['id']);
      //   }
      //   return unit;
      // }

      // await _client.from(BackendConst.cartItems).insert(cartModel.toJson());
      return unit;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in addToCart',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Map<String, List<CartModel>>> getCartItems({
    required String userId,
  }) async {
    try {
      final response = await _client
          .from('carts')
          .select('''
            cart_items (
              quantity,
              products (
                name,
                has_variants,
                base_price,
                categories(name),
                product_variants (
                 *,
                  variant_values (
                    attribute_values (*)
                  )
                ),
                product_images (*)
              )
            ) 
          ''')
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      final List<CartModel> items = [];

      for (final cart in response) {
        final List<dynamic> cartItems = cart['cart_items'] ?? [];
        for (final item in cartItems) {
          items.add(CartModel.fromJson(item));
        }
      }

      final Map<String, List<CartModel>> grouped = {};

      for (final item in items) {
        final categoryName = item.getLocalizedCategoryName('en');
        grouped.putIfAbsent(categoryName, () => []).add(item);
      }

      return grouped;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in getCartItems',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Unit> removeFromCart({required String id}) {
    try {
      return _client
          .from(BackendConst.cartItems)
          .delete()
          .eq('id', id)
          .then((_) => unit);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in removeFromCart',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }
}
