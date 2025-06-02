import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/supabase_const.dart';
import '../../../../core/errors/exceptions/exception.dart';
import '../models/category_model.dart';

final logger = Logger();

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> get fetchCategories;
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final SupabaseClient _client;
  const CategoryRemoteDataSourceImpl(this._client);

  @override
  Future<List<CategoryModel>> get fetchCategories async {
    try {
      final response = await _client.from(SupabaseConst.categories).select();
      return response.map((e) => CategoryModel.fromJson(e)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in fetchCategories',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }
}
