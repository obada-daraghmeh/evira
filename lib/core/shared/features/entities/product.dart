import 'package:equatable/equatable.dart';
import 'package:evira/core/utils/helpers/locale_helper.dart';

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
  });

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
  ];

  String getLocalizedName(String locale) =>
      LocaleHelper.localizedValue(name, locale);

  String getLocalizedDescription(String locale) =>
      LocaleHelper.localizedValue(description, locale);
}
