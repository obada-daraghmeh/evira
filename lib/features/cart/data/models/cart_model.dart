import '../../domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required super.userId,
    required super.productId,
    required super.quantity,
    required super.size,
    required super.color,
    super.id,
    super.title,
    super.price,
    super.discount,
    super.thumbnailUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': userId,
      'product_id': productId,
      'quantity': quantity,
      'size': size,
      'color': color,
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> map) {
    final product = map['products'] as Map<String, dynamic>?;

    String? matchedColorImage;

    // Check if the product has colors and pick the image from the matching color
    if (product != null && product['colors'] is List) {
      final List colorsJson = product['colors'];
      final matchingColor = colorsJson.firstWhere(
        (c) => c['hex_code'] == map['color'],
        orElse: () => null,
      );

      if (matchingColor != null && matchingColor['images'] is List) {
        final List imageList = matchingColor['images'];
        if (imageList.isNotEmpty) {
          matchedColorImage = imageList.first['image_url'];
        }
      }
    }

    return CartModel(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      productId: map['product_id'] as String,
      quantity: map['quantity'] as int,
      size: map['size'] as String,
      color: map['color'] as String,
      title: product?['title'] as String?,
      price: (product?['price'] as num?)?.toDouble(),
      discount: (product?['discount'] as num?)?.toDouble(),
      thumbnailUrl: matchedColorImage ?? product?['thumbnail_url'] as String?,
    );
  }

  factory CartModel.fromEntity(Cart cart) => CartModel(
    userId: cart.userId,
    productId: cart.productId,
    quantity: cart.quantity,
    size: cart.size,
    color: cart.color,
  );

  CartModel copyWith({
    String? userId,
    String? productId,
    int? quantity,
    String? size,
    String? color,
    String? title,
    double? price,
    double? discount,
    String? thumbnailUrl,
  }) {
    return CartModel(
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      color: color ?? this.color,
      title: title ?? this.title,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }
}
