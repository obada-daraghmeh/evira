import '../../domain/entities/product_image.dart';

class ProductImageModel extends ProductImage {
  const ProductImageModel({
    required super.productId,
    super.variantId,
    required super.imageUrl,
    required super.imageType,
    super.sortOrder,
    super.isMain,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      productId: json['product_id'] as String,
      variantId: json['variant_id'] as String?,
      imageUrl: json['image_url'] as String,
      imageType: ImageType.values.firstWhere(
        (type) => type.name == json['image_type'],
        orElse: () => ImageType.front,
      ),
      sortOrder: json['sort_order'] as int? ?? 0,
      isMain: json['is_main'] as bool? ?? false,
    );
  }
}
