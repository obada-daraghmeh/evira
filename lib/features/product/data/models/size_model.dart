import '../../domain/entities/size.dart';

class SizeModel extends Size {
  const SizeModel({required super.size});

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(size: json['size']);
  }
}
