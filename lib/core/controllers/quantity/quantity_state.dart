part of 'quantity_cubit.dart';

sealed class QuantityState extends Equatable {
  final int quantity;
  const QuantityState(this.quantity);

  @override
  List<Object> get props => [quantity];
}

final class QuantityInitial extends QuantityState {
  const QuantityInitial(super.quantity);
}

final class QuantityIncrement extends QuantityState {
  const QuantityIncrement(super.quantity);
}

final class QuantityDecrement extends QuantityState {
  const QuantityDecrement(super.quantity);
}
