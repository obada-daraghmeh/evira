part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> cartItems;
  const CartLoaded(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class CartFailure extends CartState {
  final String message;
  const CartFailure(this.message);

  @override
  List<Object> get props => [message];
}
