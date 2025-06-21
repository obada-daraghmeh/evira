import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/backend_const.dart';
import '../../../../core/errors/exceptions/exception.dart';
import '../models/brand_model.dart';

final logger = Logger();

abstract class BrandRemoteDataSource {
  Future<List<BrandModel>> get fetchBrands;
}

class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  final SupabaseClient _client;
  const BrandRemoteDataSourceImpl(this._client);

  @override
  Future<List<BrandModel>> get fetchBrands async {
    try {
      final response = await _client.from(BackendConst.categories).select();
      return response.map((e) => BrandModel.fromJson(e)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e, stackTrace) {
      logger.e(
        'Unexpected error in fetchBrands',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(e.toString());
    }
  }
}
