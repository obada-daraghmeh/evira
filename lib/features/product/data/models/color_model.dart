import '../../domain/entities/color.dart';

class ColorModel extends Color {
  const ColorModel({
    required super.hexCode,
    required super.name,
    required super.images,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      hexCode: json['hex_code'] as String,
      name: json['name'] as String,
      images: List<String>.from(
        (json['images'] as List<dynamic>? ?? []).map(
          (img) => img['image_url'] as String,
        ),
      ),
    );
  }
}
