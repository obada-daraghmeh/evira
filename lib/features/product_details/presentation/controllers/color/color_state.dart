part of 'color_cubit.dart';

sealed class ColorState extends Equatable {
  final int index;
  const ColorState(this.index);

  @override
  List<Object> get props => [index];
}

final class ColorInitial extends ColorState {
  const ColorInitial() : super(0);
}

final class ColorSelected extends ColorState {
  const ColorSelected(super.index);
}
