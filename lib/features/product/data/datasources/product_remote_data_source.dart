import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/backend_const.dart';
import '../../../../core/errors/exceptions/exception.dart';
import '../../../../core/shared/features/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> get products;
  Future<List<ProductModel>> fetchProductsByIds({required Set<String> ids});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final SupabaseClient _client;
  const ProductRemoteDataSourceImpl(this._client);

  static String get _query => '''
          *,
          colors (
            hex_code, name,
            images (image_url)
          ),
          sizes (size)
          ''';

  @override
  Future<List<ProductModel>> get products async {
    try {
      final response = await _client.from(BackendConst.products).select(_query);
      return response.map((json) => ProductModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> fetchProductsByIds({
    required Set<String> ids,
  }) async {
    try {
      final response = await _client
          .from(BackendConst.products)
          .select(_query)
          .inFilter('id', ids.toList());
      return response.map((json) => ProductModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
