import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/backend_const.dart';
import '../../../../core/errors/exceptions/exception.dart';
import '../../../../core/shared/features/models/product_model.dart';

final logger = Logger();

abstract class SearchRemoteDataSource {
  Future<List<ProductModel>> searchByTitle({required String title});
  Future<List<String>> get suggestions;
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final SupabaseClient _client;
  const SearchRemoteDataSourceImpl(this._client);

  @override
  Future<List<ProductModel>> searchByTitle({required String title}) async {
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
          .ilike('title', '%$title%');

      return response.map((json) => ProductModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in searchByTitle(title: $title)',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<String>> get suggestions async {
    try {
      // TODO: need to get suggestions with better logic, like by rating or views ...etc
      final response = await _client
          .from(BackendConst.products)
          .select('title')
          .order('created_at', ascending: false)
          .limit(5);

      return response.map((json) => json['title'] as String).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in suggestions',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }
}
