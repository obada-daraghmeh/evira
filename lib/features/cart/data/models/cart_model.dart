import '../../../product/data/models/product_image_model.dart';
import '../../../product/data/models/product_variants_model.dart';
import '../../domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required super.name,
    required super.categoryName,
    required super.basePrice,
    required super.quantity,
    required super.variants,
    required super.image,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'] as Map<String, dynamic>;
    final categoryJson = productsJson['categories'] as Map<String, dynamic>;
    // final variantsJson = json['product_variants'] as List<dynamic>;
    final imagesJson = productsJson['product_images'] as List<dynamic>?;

    final variantJson = json['product_variants'] as List<dynamic>?;
    final variants = variantJson
        ?.map((v) => ProductVariantsModel.fromJson(v as Map<String, dynamic>))
        .toList();

    // print('variants: $variants');

    final image = imagesJson
        ?.map((img) => ProductImageModel.fromJson(img as Map<String, dynamic>))
        .where((img) => img.isMain == true)
        .firstOrNull;

    return CartModel(
      quantity: json['quantity'] as int,
      name: productsJson['name'] as Map<String, dynamic>,
      categoryName: categoryJson['name'] as Map<String, dynamic>,
      basePrice: (productsJson['base_price'] as num?)?.toDouble() ?? 0.0,
      variants: variants ?? [],
      image: image?.imageUrl ?? '',
    );
  }

  factory CartModel.fromEntity(Cart cart) => CartModel(
    quantity: cart.quantity,
    name: cart.name,
    categoryName: cart.categoryName,
    basePrice: cart.basePrice,
    variants: cart.variants,
    image: cart.image,
  );
}
