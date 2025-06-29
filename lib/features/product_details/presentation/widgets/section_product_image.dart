import 'package:flutter/material.dart';

import 'partials/image_preview.dart';
import 'partials/image_type_selector.dart';

class SectionProductImage extends StatefulWidget {
  final List<String> imageUrls;
  const SectionProductImage({super.key, required this.imageUrls});

  @override
  State<SectionProductImage> createState() => _SectionProductImageState();
}

class _SectionProductImageState extends State<SectionProductImage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImagePreview(index: _selectedIndex, imageUrls: widget.imageUrls),
        ImageTypeSelector(
          selectedIndex: _selectedIndex,
          imageUrls: widget.imageUrls,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
      ],
    );
  }
}
