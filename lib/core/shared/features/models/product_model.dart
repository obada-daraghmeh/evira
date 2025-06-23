import '../../../../features/product/data/models/product_variants_model.dart';
import '../entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.categoryId,
    super.brandId,
    required super.name,
    required super.slug,
    super.description,
    required super.basePrice,
    required super.hasVariants,
    super.isActive,
    required super.imageCoverUrl,
    super.variants,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final variantJson = json['product_variants'] as List<dynamic>?;
    final variants = variantJson
        ?.map((v) => ProductVariantsModel.fromJson(v as Map<String, dynamic>))
        .toList();

    return ProductModel(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      brandId: json['brand_id'] as String?,
      name: json['name'] as Map<String, dynamic>,
      slug: json['slug'] as String,
      description: json['description'] as Map<String, dynamic>? ?? {},
      basePrice: (json['base_price'] as num?)?.toDouble() ?? 0.0,
      hasVariants: json['has_variants'] as bool,
      isActive: json['is_active'] as bool? ?? true,
      imageCoverUrl: json['image_cover_url'] as String,
      variants: variants,
    );
  }
}
