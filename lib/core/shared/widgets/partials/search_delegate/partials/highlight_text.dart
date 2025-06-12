import 'package:flutter/material.dart';

class HighlightText extends StatelessWidget {
  final String query;
  final String title;

  const HighlightText({super.key, required this.query, required this.title});

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) return Text(title);

    final lowerTitle = title.toLowerCase();
    final lowerQuery = query.toLowerCase();

    final matchIndex = lowerTitle.indexOf(lowerQuery);

    if (matchIndex == -1) return Text(title);

    final beforeMatch = title.substring(0, matchIndex);
    final matchText = title.substring(matchIndex, matchIndex + query.length);
    final afterMatch = title.substring(matchIndex + query.length);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: beforeMatch),
          TextSpan(
            text: matchText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          TextSpan(text: afterMatch),
        ],
      ),
    );
  }
}
