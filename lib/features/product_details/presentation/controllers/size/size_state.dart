part of 'size_cubit.dart';

sealed class SizeState extends Equatable {
  final int index;
  const SizeState(this.index);

  @override
  List<Object> get props => [index];
}

final class SizeInitial extends SizeState {
  const SizeInitial() : super(-1);
}

final class SizeSelected extends SizeState {
  const SizeSelected(super.index);
}
