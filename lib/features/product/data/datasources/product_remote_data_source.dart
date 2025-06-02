import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/supabase_const.dart';
import '../../../../core/errors/exceptions/exception.dart';
import '../../../../core/shared/features/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> get products;
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final SupabaseClient _client;
  const ProductRemoteDataSourceImpl(this._client);

  @override
  Future<List<ProductModel>> get products async {
    try {
      final response = await _client.from(SupabaseConst.products).select('''
          *,
          colors (
            hex_code, name,
            images (image_url)
          ),
          sizes (size)
          ''');

      return response.map((json) => ProductModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
