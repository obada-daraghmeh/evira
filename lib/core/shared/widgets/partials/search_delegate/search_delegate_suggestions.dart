import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/search/search_bloc.dart';
import 'partials/highlight_text.dart';
import 'partials/no_matching_suggestion.dart';

class SearchDelegateSuggestions extends StatelessWidget {
  final String query;
  final SearchBloc controller;
  final void Function(String title) onTap;

  const SearchDelegateSuggestions({
    super.key,
    required this.query,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: controller,
      builder: (context, state) {
        if (state is SearchLoading) {
          return const LinearProgressIndicator();
        }

        if (state is SearchResultsLoaded && state.products.isNotEmpty) {
          final suggestions = state.products;
          return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final title = suggestions[index].title;
              return ListTile(
                title: HighlightText(query: query, title: title),
                onTap: () => onTap(title),
              );
            },
          );
        }

        return NoMatchingSuggestion(query: query);
      },
    );
  }
}
