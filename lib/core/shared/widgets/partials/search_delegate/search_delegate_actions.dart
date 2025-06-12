import 'package:flutter/material.dart';

import '../../../../utils/extensions/constants_extension.dart';
import '../../../../utils/extensions/intl_extension.dart';

class SearchDelegateActions extends StatelessWidget {
  final String query;
  final VoidCallback onPressed;

  const SearchDelegateActions({
    super.key,
    required this.query,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.pR8,
      child: _buildChildAnimation(context, _buildChild(context)),
    );
  }

  AnimatedSwitcher _buildChildAnimation(BuildContext context, Widget child) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
      child: child,
    );
  }

  Widget _buildChild(BuildContext context) {
    return query.isNotEmpty
        ? IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.clear),
            tooltip: context.l10n.clear,
          )
        : const SizedBox.shrink();
  }
}
