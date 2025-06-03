part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Cart cart;

  const AddToCart({required this.cart});

  @override
  List<Object> get props => [cart];
}

class RemoveFromCart extends CartEvent {
  final String id;
  final String userId;

  const RemoveFromCart({required this.id, required this.userId});

  @override
  List<Object> get props => [id, userId];
}

class GetCartItems extends CartEvent {
  final String userId;

  const GetCartItems({required this.userId});

  @override
  List<Object> get props => [userId];
}
