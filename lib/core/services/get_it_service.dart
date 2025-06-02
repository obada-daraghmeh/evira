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
import '../../features/category/data/datasources/category_remote_data_source.dart';
import '../../features/category/data/repositories/category_repository_impl.dart';
import '../../features/category/domain/repositories/category_repository.dart';
import '../../features/category/domain/usecases/fetch_categories.dart';
import '../../features/category_products/data/datasources/category_products_remote_data_source.dart';
import '../../features/category_products/data/repositories/category_products_repository_impl.dart';
import '../../features/category_products/domain/repositories/category_products_repository.dart';
import '../../features/category_products/domain/usecases/fetch_products_by_category.dart';
import '../../features/category_products/presentation/bloc/category_products_bloc.dart';
import '../../features/navigation/data/datasources/navigation_local_data_source.dart';
import '../../features/navigation/data/repositories/navigation_repository_impl.dart';
import '../../features/navigation/domain/repositories/navigation_repository.dart';
import '../../features/navigation/domain/usecases/fetch_bottom_bar_items.dart';
import '../../features/navigation/domain/usecases/fetch_pages.dart';
import '../../features/navigation/presentation/cubit/navigation_cubit.dart';
import '../../features/product/data/datasources/product_remote_data_source.dart';
import '../../features/product/data/repositories/product_repository_impl.dart';
import '../../features/product/domain/repositories/product_repository.dart';
import '../../features/product/domain/usecases/fetch_products.dart';
import '../controllers/auth_status/auth_status_cubit.dart';
import '../controllers/category/category_bloc.dart';
import '../controllers/product/product_bloc.dart';
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
      ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<CategoryRemoteDataSource>(
        () => CategoryRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<CategoryProductsRemoteDataSource>(
        () => CategoryProductsRemoteDataSourceImpl(getIt()),
      )
      /// `LocalDataSources`
      ..registerFactory<NavigationLocalDataSource>(
        () => NavigationLocalDataSourceImpl(),
      );
  }

  void _initRepositories() {
    getIt
      ..registerFactory<AuthRepository>(() => AuthRepositoryImpl())
      ..registerFactory<NavigationRepository>(() => NavigationRepositoryImpl())
      ..registerFactory<CategoryRepository>(() => CategoryRepositoryImpl())
      ..registerFactory<ProductRepository>(() => ProductRepositoryImpl())
      ..registerFactory<CategoryProductsRepository>(
        () => CategoryProductsRepositoryImpl(),
      );
  }

  void _initUseCases() {
    getIt
      /// `AuthUseCases`
      ..registerFactory<SignUpUseCase>(() => SignUpUseCase())
      ..registerFactory<SignInUseCase>(() => SignInUseCase())
      ..registerFactory<CurrentUserUseCase>(() => CurrentUserUseCase())
      ..registerFactory<SignOutUseCase>(() => SignOutUseCase())
      /// `NavigationUseCases`
      ..registerFactory<FetchPagesUseCase>(() => FetchPagesUseCase())
      ..registerFactory<FetchBottomBarItemsUseCase>(
        () => FetchBottomBarItemsUseCase(),
      )
      /// `CategoryUseCases`
      ..registerFactory<FetchCategoriesUseCase>(() => FetchCategoriesUseCase())
      /// `ProductUseCases`
      ..registerFactory<FetchProductsUseCase>(() => FetchProductsUseCase())
      ..registerFactory<FetchProductsByCategoryUseCase>(
        () => FetchProductsByCategoryUseCase(),
      );
  }

  void _initBlocs() {
    getIt
      ..registerLazySingleton<ThemeModeCubit>(() => ThemeModeCubit())
      ..registerLazySingleton<AuthBloc>(() => AuthBloc())
      ..registerLazySingleton<AuthStatusCubit>(() => AuthStatusCubit())
      ..registerFactory<NavigationCubit>(() => NavigationCubit())
      ..registerLazySingleton<CategoryBloc>(() => CategoryBloc())
      ..registerLazySingleton<ProductBloc>(() => ProductBloc())
      ..registerFactory<CategoryProductsBloc>(() => CategoryProductsBloc());
  }
}
