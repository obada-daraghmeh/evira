import 'package:flutter/material.dart';

import 'partials/section_header.dart';

class SectionProductReviews extends StatelessWidget {
  const SectionProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(text: 'Reviews (0)'),
        Text('Under development ...'),
      ],
    );
  }
}
