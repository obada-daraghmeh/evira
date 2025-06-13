import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/backend_const.dart';
import '../../../../core/errors/exceptions/exception.dart';
import '../../../../core/shared/features/models/product_model.dart';

final logger = Logger();

abstract class CategoryProductsRemoteDataSource {
  Future<List<ProductModel>> productsByCategory({required String categoryId});
}

class CategoryProductsRemoteDataSourceImpl
    implements CategoryProductsRemoteDataSource {
  final SupabaseClient _client;
  const CategoryProductsRemoteDataSourceImpl(this._client);

  @override
  Future<List<ProductModel>> productsByCategory({
    required String categoryId,
  }) async {
    try {
      final response = await _client
          .from(BackendConst.products)
          .select('''
            *,
            colors (
              hex_code, name,
              images (image_url)
            ),
            sizes (size)
          ''')
          .eq('category_id', categoryId);

      return response.map((json) => ProductModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in productsByCategory(categoryId: $categoryId)',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }
}
