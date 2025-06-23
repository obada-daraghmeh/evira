import 'package:equatable/equatable.dart';

import 'variant_attribute.dart';

class ProductVariants extends Equatable {
  final String id;
  final String productId;
  final String sku;
  final double? price;
  final int? stock;
  final bool? isActive;
  final List<VariantAttribute> variantAttributes;

  const ProductVariants({
    required this.id,
    required this.productId,
    required this.sku,
    this.price,
    this.stock,
    this.isActive,
    required this.variantAttributes,
  });

  @override
  List<Object?> get props => [
    id,
    productId,
    sku,
    price,
    stock,
    isActive,
    variantAttributes,
  ];
}
