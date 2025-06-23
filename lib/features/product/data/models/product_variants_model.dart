import '../../domain/entities/product_variants.dart';
import 'variant_attribute_model.dart';

class ProductVariantsModel extends ProductVariants {
  const ProductVariantsModel({
    required super.id,
    required super.productId,
    required super.sku,
    super.price,
    super.stock,
    super.isActive,
    required super.variantAttributes,
  });

  factory ProductVariantsModel.fromJson(Map<String, dynamic> json) {
    final variantValuesJson = json['variant_values'] as List<dynamic>;
    final variantAttributes = (variantValuesJson)
        .map((e) => VariantAttributeModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return ProductVariantsModel(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      sku: json['sku'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? true,
      variantAttributes: variantAttributes,
    );
  }
}
