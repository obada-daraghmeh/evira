import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/current_user.dart';
import '../../features/auth/domain/usecases/sign_in.dart';
import '../../features/auth/domain/usecases/sign_out.dart';
import '../../features/auth/domain/usecases/sign_up.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../controllers/auth_status/auth_status_cubit.dart';
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

  void _initServices() {
    getIt
    /// `RemoteDataSources`
    .registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt()),
    );
  }

  void _initRepositories() {
    getIt.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
  }

  void _initUseCases() {
    getIt
      /// `AuthUseCases`
      ..registerFactory<SignUpUseCase>(() => SignUpUseCase())
      ..registerFactory<SignInUseCase>(() => SignInUseCase())
      ..registerFactory<CurrentUserUseCase>(() => CurrentUserUseCase())
      ..registerFactory<SignOutUseCase>(() => SignOutUseCase());
  }

  void _initBlocs() {
    getIt
      ..registerLazySingleton<ThemeModeCubit>(() => ThemeModeCubit())
      ..registerLazySingleton<AuthBloc>(() => AuthBloc())
      ..registerLazySingleton<AuthStatusCubit>(() => AuthStatusCubit());
  }
}
