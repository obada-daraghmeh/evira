import 'package:equatable/equatable.dart';

class Size extends Equatable {
  final String size;

  const Size({required this.size});

  @override
  List<Object?> get props => [size];
}
