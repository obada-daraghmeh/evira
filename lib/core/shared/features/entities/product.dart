import 'package:equatable/equatable.dart';
import 'package:evira/features/product/domain/entities/color.dart'
    as color_entity;
import 'package:evira/features/product/domain/entities/size.dart'
    as size_entity;

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final List<color_entity.Color> colors;
  final List<String> images;
  final List<size_entity.Size> sizes;
  final double price;
  final double discount;
  final String currencyCode;
  final int salesNumber;
  final int stock;
  final bool inStock;
  final String thumbnailUrl;
  final DateTime createdAt;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.colors,
    required this.images,
    required this.sizes,
    required this.price,
    required this.discount,
    required this.currencyCode,
    required this.salesNumber,
    required this.stock,
    required this.inStock,
    required this.thumbnailUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    categoryId,
    colors,
    images,
    sizes,
    price,
    discount,
    currencyCode,
    salesNumber,
    stock,
    inStock,
    thumbnailUrl,
    createdAt,
  ];
}
