import 'package:flutter/material.dart';

import '../../../../../utils/extensions/constants_extension.dart';
import '../../../../../utils/extensions/intl_extension.dart';
import '../../../../../utils/extensions/theme_extension.dart';

class NoMatchingSuggestion extends StatelessWidget {
  final String query;
  const NoMatchingSuggestion({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.padding.p24,
        child: RichText(
          text: TextSpan(
            text: context.l10n.noSuggestionsMatch,
            children: [
              TextSpan(
                text: '"$query"',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.blue,
                ),
              ),
            ],
            style: context.textTheme.titleMedium,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
