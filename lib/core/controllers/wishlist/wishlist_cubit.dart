import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/product/domain/repositories/product_repository.dart';
import '../../../features/wishlist/domain/repositories/wishlist_repository.dart';
import '../../services/get_it_service.dart';
import '../../shared/features/entities/product.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistInitial());

  Future<void> get fetchWishlist async {
    emit(const WishlistLoading());
    final response = await getIt<WishlistRepository>().fetchWishlist;
    await response.fold(
      (failure) async => emit(WishlistFailure(message: failure.message)),
      (wishlistIds) async {
        final productResponse = await getIt<ProductRepository>()
            .fetchProductsByIds(ids: wishlistIds.toSet());

        productResponse.fold(
          (failure) => emit(WishlistFailure(message: failure.message)),
          (products) => emit(
            WishlistLoaded(
              wishlistIds: wishlistIds.toSet(),
              products: products,
            ),
          ),
        );
      },
    );
  }

  void toggleWishlist(String productId) async {
    final wishlistIds = Set<String>.from(state.wishlistIds);

    if (wishlistIds.contains(productId)) {
      wishlistIds.remove(productId);
      getIt<WishlistRepository>().removeFromWishlist(productId);
    } else {
      wishlistIds.add(productId);
      getIt<WishlistRepository>().addToWishlist(productId);
    }

    final productResponse = await getIt<ProductRepository>().fetchProductsByIds(
      ids: wishlistIds.toSet(),
    );

    productResponse.fold(
      (failure) => emit(WishlistFailure(message: failure.message)),
      (products) =>
          emit(WishlistLoaded(wishlistIds: wishlistIds, products: products)),
    );
  }

  bool isInWishlist(String productId) => state.wishlistIds.contains(productId);
}
