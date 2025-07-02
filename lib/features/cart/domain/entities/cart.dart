import 'package:equatable/equatable.dart';
import 'package:evira/core/shared/features/entities/product.dart';
import 'package:evira/core/utils/helpers/locale_helper.dart';

import '../../../product/domain/entities/product_variants.dart';

class Cart extends Equatable {
  final Map<String, dynamic> name;
  final Map<String, dynamic> categoryName;
  final double basePrice;
  final int quantity;
  final List<ProductVariants> variants;
  final String image;

  const Cart({
    required this.name,
    required this.categoryName,
    required this.basePrice,
    required this.quantity,
    required this.variants,
    required this.image,
  });

  double? get price => variants.isNotEmpty ? variants.first.price : basePrice;

  String getLocalizedName(String locale) =>
      LocaleHelper.localizedValue(name, locale);

  String getLocalizedCategoryName(String locale) =>
      LocaleHelper.localizedValue(categoryName, locale);

  bool hasVariantAttribute(ProductAttributeType type, {String locale = 'en'}) {
    final key = type.name.toLowerCase();
    return variants.any(
      (v) => v.variantAttributes.any(
        (attr) => attr.attributeName[locale]?.toLowerCase() == key,
      ),
    );
  }

  List getVariantValues(ProductAttributeType type, {String locale = 'en'}) {
    final key = type.name.toLowerCase();
    return variants
        .expand((v) => v.variantAttributes)
        .where((attr) => attr.attributeName[locale]?.toLowerCase() == key)
        .map((attr) => attr.value[locale] ?? '')
        .toSet()
        .toList();
  }

  @override
  List<Object?> get props => [
    name,
    categoryName,
    basePrice,
    quantity,
    variants,
    image,
  ];
}
