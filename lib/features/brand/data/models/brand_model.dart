import '../../domain/entities/brand.dart';

class BrandModel extends Brand {
  const BrandModel({
    required super.id,
    required super.name,
    required super.slug,
    super.description,
    super.isActive,
    required super.logoUrl,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] as String,
      name: json['name'] as Map<String, dynamic>,
      slug: json['slug'] as String,
      description: json['description'] as Map<String, dynamic>? ?? {},
      isActive: json['is_active'] as bool? ?? true,
      logoUrl: json['logo_url'] as String,
    );
  }
}
