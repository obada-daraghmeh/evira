import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../controllers/theme_mode/theme_mode_cubit.dart';
import '../errors/exceptions/exception.dart';

final getIt = GetIt.instance;

class GetItService {
  Future<void> init() async {
    await _initSupabase();
    _initServices();
    _initRepositories();
    _initUseCases();
    _initBlocs();
  }

  Future<void> _initSupabase() async {
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

  void _initServices() {}

  void _initRepositories() {}

  void _initUseCases() {}

  void _initBlocs() {
    getIt.registerLazySingleton<ThemeModeCubit>(() => ThemeModeCubit());
  }
}
