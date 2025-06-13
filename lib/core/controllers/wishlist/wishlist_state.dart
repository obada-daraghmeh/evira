part of 'wishlist_cubit.dart';

sealed class WishlistState extends Equatable {
  final Set<String> wishlistIds;
  final List<Product> products;

  const WishlistState({required this.wishlistIds, required this.products});

  @override
  List<Object> get props => [wishlistIds, products];
}

final class WishlistInitial extends WishlistState {
  const WishlistInitial() : super(wishlistIds: const {}, products: const []);
}

final class WishlistLoading extends WishlistState {
  const WishlistLoading() : super(wishlistIds: const {}, products: const []);
}

final class WishlistLoaded extends WishlistState {
  const WishlistLoaded({required super.wishlistIds, required super.products});
}

final class WishlistFailure extends WishlistState {
  final String message;
  const WishlistFailure({required this.message})
    : super(wishlistIds: const {}, products: const []);

  @override
  List<Object> get props => [message];
}
