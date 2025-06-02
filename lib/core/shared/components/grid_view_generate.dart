import 'package:flutter/material.dart';

import '../../utils/extensions/constants_extension.dart';

class GridViewGenerate extends StatelessWidget {
  final int length;
  final double width;
  final IndexedWidgetBuilder child;

  const GridViewGenerate({
    super.key,
    required this.length,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.spacing.s12,
      runSpacing: context.spacing.s12,
      children: List.generate(
        length,
        (index) => SizedBox(width: width, child: child(context, index)),
      ),
    );
  }
}
