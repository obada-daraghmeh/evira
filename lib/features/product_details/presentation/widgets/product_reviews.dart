import 'package:flutter/material.dart';

import 'product_section_text.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductSectionHeader(text: 'Reviews (0)'),
        Text('Under development ...'),
      ],
    );
  }
}
