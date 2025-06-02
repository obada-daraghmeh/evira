import 'dart:ui';

class ProductHelpers {
  static double calcTotalPrice({
    required double price,
    required double discount,
    int quantity = 1,
  }) {
    final discountedUnitPrice = price * (1 - discount);
    return discountedUnitPrice * quantity;
  }

  static int calcDiscount(double discount) => (discount * 100).toInt();

  static Color colorFromHexCode(String hexCode) =>
      Color(int.parse('0xFF${hexCode.substring(1)}'));
}
