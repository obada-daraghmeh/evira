import 'package:flutter/widgets.dart';

import '../components/bottom_sheet_container.dart';

class CustomDraggableSheet extends StatelessWidget {
  final List<Widget> children;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;

  const CustomDraggableSheet({
    super.key,
    required this.children,
    this.initialChildSize = 0.4,
    this.minChildSize = 0.4,
    this.maxChildSize = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      builder: (context, scrollController) => BottomSheetContainer(
        child: ListView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: children,
        ),
      ),
    );
  }
}
