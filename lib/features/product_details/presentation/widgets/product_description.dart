import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class ProductDescription extends StatefulWidget {
  final String description;
  const ProductDescription({super.key, required this.description});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.bodyMedium?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Text(
            widget.description,
            style: textStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          secondChild: Text(widget.description, style: textStyle),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
        SizedBox(height: context.spacing.s4),
        GestureDetector(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Text(
            _isExpanded ? context.l10n.less : context.l10n.readMore,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
