import 'package:equatable/equatable.dart';

enum ImageType {
  front,
  back,
  side,
  top,
  bottom,
  angle,
  closeup,
  lifestyle,
  package,
}

class ProductImage extends Equatable {
  final String productId;
  final String? variantId;
  final String imageUrl;
  final ImageType imageType;
  final int sortOrder;
  final bool isMain;

  const ProductImage({
    required this.productId,
    this.variantId,
    required this.imageUrl,
    required this.imageType,
    this.sortOrder = 0,
    this.isMain = false,
  });

  @override
  List<Object?> get props => [
    productId,
    variantId,
    imageUrl,
    imageType,
    sortOrder,
    isMain,
  ];
}
