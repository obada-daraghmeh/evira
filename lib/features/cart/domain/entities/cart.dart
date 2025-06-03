import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final String? id;
  final String userId;
  final String productId;
  final int quantity;
  final String size;
  final String color;

  final String? title;
  final double? price;
  final double? discount;
  final String? thumbnailUrl;

  const Cart({
    this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.size,
    required this.color,
    this.title,
    this.price,
    this.discount,
    this.thumbnailUrl,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    productId,
    quantity,
    size,
    color,
    title,
    price,
    discount,
    thumbnailUrl,
  ];
}
