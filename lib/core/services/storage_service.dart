import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/backend_const.dart';
import '../errors/exceptions/exception.dart';
import 'get_it_service.dart';

class StorageService {
  static Future<void> get initHydrated async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
  }

  static Future<void> get initHive async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen(BackendConst.searchHistoryBox)) {
      await Hive.openBox(BackendConst.searchHistoryBox);
    }
  }

  static Future<void> get initSupabase async {
    try {
      final supabase = await Supabase.initialize(
        url: dotenv.env['SUPABASE_URL']!,
        anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      );

      getIt.registerLazySingleton<SupabaseClient>(() => supabase.client);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
