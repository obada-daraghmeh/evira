import 'package:evira/core/routers/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/current_user.dart';
import '../../features/auth/domain/usecases/sign_in.dart';
import '../../features/auth/domain/usecases/sign_out.dart';
import '../../features/auth/domain/usecases/sign_up.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/brand/data/datasources/brand_remote_data_source.dart';
import '../../features/brand/data/repositories/brand_repository_impl.dart';
import '../../features/brand/domain/repositories/brand_repository.dart';
import '../../features/brand/domain/usecases/fetch_brands.dart';
import '../../features/brand/presentation/bloc/brand_bloc.dart';
import '../../features/cart/data/datasources/cart_remote_data_source.dart';
import '../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../features/cart/domain/repositories/cart_repository.dart';
import '../../features/cart/domain/usecases/add_to_cart.dart';
import '../../features/cart/domain/usecases/get_cart_items.dart';
import '../../features/cart/domain/usecases/remove_from_cart.dart';
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
import '../../features/product/domain/usecases/fetch_products_by_ids.dart';
import '../../features/product_details/presentation/controllers/color/color_cubit.dart';
import '../../features/product_details/presentation/controllers/size/size_cubit.dart';
import '../../features/profile/data/datasources/profile_local_data_source.dart';
import '../../features/profile/data/datasources/profile_remote_data_source.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/usecases/fetch_profile_menu_option_item.dart';
import '../../features/profile/domain/usecases/fetch_setting_menu_option_item.dart';
import '../../features/profile/domain/usecases/update_profile.dart';
import '../../features/profile/domain/usecases/update_profile_avatar.dart';
import '../../features/profile/presentation/controllers/menu_option/menu_option_cubit.dart';
import '../../features/profile/presentation/controllers/profile/profile_bloc.dart';
import '../../features/search/data/datasources/search_local_data_source.dart';
import '../../features/search/data/datasources/search_remote_data_source.dart';
import '../../features/search/data/repositories/search_repository_impl.dart';
import '../../features/search/domain/repositories/search_repository.dart';
import '../../features/search/domain/usecases/add_to_history.dart';
import '../../features/search/domain/usecases/clear_history.dart';
import '../../features/search/domain/usecases/delete_from_history.dart';
import '../../features/search/domain/usecases/fetch_history.dart';
import '../../features/search/domain/usecases/fetch_suggestions.dart';
import '../../features/search/domain/usecases/search_by_title.dart';
import '../../features/wishlist/data/datasources/wishlist_remote_data_source.dart';
import '../../features/wishlist/data/repositories/wishlist_repository_impl.dart';
import '../../features/wishlist/domain/repositories/wishlist_repository.dart';
import '../../features/wishlist/domain/usecases/add_to_wishlist.dart';
import '../../features/wishlist/domain/usecases/fetch_wishlist.dart';
import '../../features/wishlist/domain/usecases/remove_from_wishlist.dart';
import '../controllers/auth_status/auth_status_cubit.dart';
import '../controllers/cart/cart_bloc.dart';
import '../controllers/category/category_bloc.dart';
import '../controllers/product/product_bloc.dart';
import '../controllers/quantity/quantity_cubit.dart';
import '../controllers/search/search_bloc.dart';
import '../controllers/theme_mode/theme_mode_cubit.dart';
import '../controllers/wishlist/wishlist_cubit.dart';
import 'storage_service.dart';

final getIt = GetIt.instance;

class GetItService {
  Future<void> get init async {
    await _initStorages;
    _initServices;
    _initRepositories;
    _initUseCases;
    _initBlocs;
    getIt.registerSingleton<GoRouter>(createRouter(getIt<AuthStatusCubit>()));
  }

  Future<void> get _initStorages async {
    await StorageService.initHydrated;
    await StorageService.initHive;
    await StorageService.initSupabase;
  }

  void get _initServices {
    getIt
      ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<CategoryRemoteDataSource>(
        () => CategoryRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<BrandRemoteDataSource>(
        () => BrandRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<CategoryProductsRemoteDataSource>(
        () => CategoryProductsRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<NavigationLocalDataSource>(
        () => NavigationLocalDataSourceImpl(),
      )
      ..registerFactory<CartRemoteDataSource>(
        () => CartRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<ProfileLocalDataSource>(
        () => ProfileLocalDataSourceImpl(),
      )
      ..registerFactory<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl(getIt()),
      )
      ..registerFactory<SearchLocalDataSource>(
        () => SearchLocalDataSourceImpl(),
      )
      ..registerFactory<WishlistRemoteDataSource>(
        () => WishlistRemoteDataSourceImpl(getIt()),
      );
  }

  void get _initRepositories {
    getIt
      ..registerFactory<AuthRepository>(() => AuthRepositoryImpl())
      ..registerFactory<NavigationRepository>(() => NavigationRepositoryImpl())
      ..registerFactory<CategoryRepository>(() => CategoryRepositoryImpl())
      ..registerFactory<BrandRepository>(() => BrandRepositoryImpl())
      ..registerFactory<ProductRepository>(() => ProductRepositoryImpl())
      ..registerFactory<CategoryProductsRepository>(
        () => CategoryProductsRepositoryImpl(),
      )
      ..registerFactory<CartRepository>(() => CartRepositoryImpl())
      ..registerFactory<ProfileRepository>(() => ProfileRepositoryImpl())
      ..registerFactory<SearchRepository>(() => SearchRepositoryImpl())
      ..registerFactory<WishlistRepository>(() => WishlistRepositoryImpl());
  }

  void get _initUseCases {
    getIt
      ..registerFactory<SignUpUseCase>(() => SignUpUseCase())
      ..registerFactory<SignInUseCase>(() => SignInUseCase())
      ..registerFactory<CurrentUserUseCase>(() => CurrentUserUseCase())
      ..registerFactory<SignOutUseCase>(() => SignOutUseCase())
      ..registerFactory<FetchPagesUseCase>(() => FetchPagesUseCase())
      ..registerFactory<FetchBottomBarItemsUseCase>(
        () => FetchBottomBarItemsUseCase(),
      )
      ..registerFactory<FetchCategoriesUseCase>(() => FetchCategoriesUseCase())
      ..registerFactory<FetchBrandsUseCase>(() => FetchBrandsUseCase())
      ..registerFactory<FetchProductsUseCase>(() => FetchProductsUseCase())
      ..registerFactory<FetchProductsByCategoryUseCase>(
        () => FetchProductsByCategoryUseCase(),
      )
      ..registerFactory<AddToCartUseCase>(() => AddToCartUseCase())
      ..registerFactory<GetCartItemsUseCase>(() => GetCartItemsUseCase())
      ..registerFactory<RemoveFromCartUseCase>(() => RemoveFromCartUseCase())
      ..registerFactory<FetchProfileMenuOptionUseCase>(
        () => FetchProfileMenuOptionUseCase(),
      )
      ..registerFactory<FetchSettingMenuOptionUseCase>(
        () => FetchSettingMenuOptionUseCase(),
      )
      ..registerFactory<UpdateProfileUseCase>(() => UpdateProfileUseCase())
      ..registerFactory<UpdateProfileAvatarUseCase>(
        () => UpdateProfileAvatarUseCase(),
      )
      ..registerFactory<FetchSuggestionsUseCase>(
        () => FetchSuggestionsUseCase(),
      )
      ..registerFactory<SearchByTitleUseCase>(() => SearchByTitleUseCase())
      ..registerFactory<AddToHistoryUseCase>(() => AddToHistoryUseCase())
      ..registerFactory<FetchHistoryUseCase>(() => FetchHistoryUseCase())
      ..registerFactory<DeleteFromHistoryUseCase>(
        () => DeleteFromHistoryUseCase(),
      )
      ..registerFactory<ClearHistoryUseCase>(() => ClearHistoryUseCase())
      ..registerFactory<FetchWishlistUseCase>(() => FetchWishlistUseCase())
      ..registerFactory<AddToWishlistUseCase>(() => AddToWishlistUseCase())
      ..registerFactory<RemoveFromWishlistUseCase>(
        () => RemoveFromWishlistUseCase(),
      )
      ..registerFactory<FetchProductsByIdsUseCase>(
        () => FetchProductsByIdsUseCase(),
      );
  }

  void get _initBlocs {
    getIt
      ..registerLazySingleton<ThemeModeCubit>(() => ThemeModeCubit())
      ..registerLazySingleton<AuthBloc>(() => AuthBloc())
      ..registerLazySingleton<AuthStatusCubit>(() => AuthStatusCubit())
      ..registerFactory<NavigationCubit>(() => NavigationCubit())
      ..registerLazySingleton<CategoryBloc>(() => CategoryBloc())
      ..registerLazySingleton<BrandBloc>(() => BrandBloc())
      ..registerLazySingleton<ProductBloc>(() => ProductBloc())
      ..registerFactory<CategoryProductsBloc>(() => CategoryProductsBloc())
      ..registerFactory<QuantityCubit>(() => QuantityCubit())
      ..registerFactory<SizeCubit>(() => SizeCubit())
      ..registerFactory<ColorCubit>(() => ColorCubit())
      ..registerFactory<CartBloc>(() => CartBloc())
      ..registerFactory<ProfileBloc>(() => ProfileBloc())
      ..registerFactory<MenuOptionCubit>(() => MenuOptionCubit())
      ..registerFactory<SearchBloc>(() => SearchBloc())
      ..registerFactory<WishlistCubit>(() => WishlistCubit());
  }
}
