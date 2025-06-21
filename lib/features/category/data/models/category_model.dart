import '../../../../core/shared/features/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    super.parentId,
    required super.name,
    required super.slug,
    super.description,
    super.sortOrder,
    super.isActive,
    super.isFeatured,
    required super.iconUrl,
    super.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      parentId: json['parent_id'] as String? ?? '',
      name: json['name'] as Map<String, dynamic>,
      slug: json['slug'] as String,
      description: json['description'] as Map<String, dynamic>? ?? {},
      sortOrder: json['sort_order'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? true,
      isFeatured: json['is_featured'] as bool? ?? false,
      iconUrl: json['icon_url'] as String,
      imageUrl: json['image_url'] as String? ?? '',
    );
  }
}
