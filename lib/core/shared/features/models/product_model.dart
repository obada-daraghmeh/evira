import '../../../../features/product/data/models/color_model.dart';
import '../../../../features/product/data/models/size_model.dart';
import '../entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.categoryId,
    required super.colors,
    required super.images,
    required super.sizes,
    required super.price,
    required super.discount,
    required super.currencyCode,
    required super.salesNumber,
    required super.stock,
    required super.inStock,
    required super.thumbnailUrl,
    required super.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final colorsJson = json['colors'] as List<dynamic>? ?? [];
    final sizesJson = json['sizes'] as List<dynamic>? ?? [];

    final colors = colorsJson.map((c) => ColorModel.fromJson(c)).toList();
    final images = colors.expand((color) => color.images).toList();
    final sizes = sizesJson.map((s) => SizeModel.fromJson(s)).toList();

    return ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      categoryId: json['category_id'] as String,
      colors: colors,
      images: images,
      sizes: sizes,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      currencyCode: json['currency_code'] as String,
      salesNumber: json['sales_number'] as int? ?? 0,
      stock: json['stock'] as int? ?? 0,
      inStock: json['in_stock'] as bool? ?? false,
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }
}
