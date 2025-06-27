import 'package:equatable/equatable.dart';

import '../../../../features/product/domain/entities/product_image.dart';
import '../../../../features/product/domain/entities/product_variants.dart';
import '../../../utils/helpers/locale_helper.dart';

enum ProductAttributeType { size, color }

class Product extends Equatable {
  final String id;
  final String categoryId;
  final String? brandId;
  final Map<String, dynamic> name;
  final String slug;
  final Map<String, dynamic>? description;
  final double basePrice;
  final bool hasVariants;
  final bool? isActive;
  final String imageCoverUrl;
  final List<ProductVariants>? variants;
  final List<ProductImage> images;

  const Product({
    required this.id,
    required this.categoryId,
    this.brandId,
    required this.name,
    required this.slug,
    this.description,
    required this.basePrice,
    required this.hasVariants,
    this.isActive,
    required this.imageCoverUrl,
    this.variants,
    required this.images,
  });

  String getLocalizedName(String locale) =>
      LocaleHelper.localizedValue(name, locale);

  String getLocalizedDescription(String locale) =>
      LocaleHelper.localizedValue(description, locale);

  bool hasVariantAttribute(ProductAttributeType type, {String locale = 'en'}) {
    final key = type.name.toLowerCase();
    return variants?.any(
          (v) => v.variantAttributes.any(
            (attr) => attr.attributeName[locale]?.toLowerCase() == key,
          ),
        ) ??
        false;
  }

  List getVariantValues(ProductAttributeType type, {String locale = 'en'}) {
    final key = type.name.toLowerCase();
    return variants
            ?.expand((v) => v.variantAttributes)
            .where((attr) => attr.attributeName[locale]?.toLowerCase() == key)
            .map((attr) => attr.value[locale] ?? '')
            .toSet()
            .toList() ??
        [];
  }

  String getSizeName(int index) =>
      getVariantValues(ProductAttributeType.size)[index];

  String getColorName(int index) =>
      getVariantValues(ProductAttributeType.color)[index];

  @override
  List<Object?> get props => [
    id,
    categoryId,
    brandId,
    name,
    slug,
    description,
    basePrice,
    hasVariants,
    isActive,
    imageCoverUrl,
    variants,
    images,
  ];
}
