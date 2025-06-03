import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit({int initialQuantity = 1})
    : super(QuantityInitial(initialQuantity));

  void increment() => emit(QuantityIncrement(state.quantity + 1));

  void decrement() => emit(
    QuantityDecrement(state.quantity > 1 ? state.quantity - 1 : state.quantity),
  );
}
