import 'package:flutter/material.dart';

class HorizontalListGenerate extends StatelessWidget {
  final int length;
  final Widget Function(int) generator;

  const HorizontalListGenerate({
    super.key,
    required this.length,
    required this.generator,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(length, (index) => generator(index))),
    );
  }
}
