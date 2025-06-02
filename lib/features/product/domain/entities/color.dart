import 'package:equatable/equatable.dart';

class Color extends Equatable {
  final String hexCode;
  final String name;
  final List<String> images;

  const Color({
    required this.hexCode,
    required this.name,
    required this.images,
  });

  @override
  List<Object?> get props => [hexCode, name, images];
}
