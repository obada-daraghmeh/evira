import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/cart/domain/entities/cart.dart';
import '../../../features/cart/domain/usecases/add_to_cart.dart';
import '../../../features/cart/domain/usecases/get_cart_items.dart';
import '../../../features/cart/domain/usecases/remove_from_cart.dart';
import '../../services/get_it_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCart>((event, emit) async {
      emit(CartLoading());
      final response = await getIt<AddToCartUseCase>()(event.cart);
      response.fold(
        (failure) => emit(CartFailure(failure.message)),
        (_) => emit(CartLoaded({})),
      );
    });

    on<GetCartItems>((event, emit) async {
      emit(CartLoading());
      final response = await getIt<GetCartItemsUseCase>()(event.userId);
      response.fold(
        (failure) => emit(CartFailure(failure.message)),
        (cart) => emit(CartLoaded(cart)),
      );
    });

    on<RemoveFromCart>((event, emit) async {
      emit(CartLoading());
      final response = await getIt<RemoveFromCartUseCase>()(event.id);
      final cartResponse = await getIt<GetCartItemsUseCase>()(event.userId);
      response.fold((failure) => emit(CartFailure(failure.message)), (_) async {
        cartResponse.fold(
          (failure) => emit(CartFailure(failure.message)),
          (cart) => emit(CartLoaded(cart)),
        );
      });
    });
  }
}
