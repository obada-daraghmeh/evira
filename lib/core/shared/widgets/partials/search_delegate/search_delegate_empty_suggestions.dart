import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/search/search_bloc.dart';
import '../../../../utils/extensions/constants_extension.dart';
import '../../../../utils/extensions/intl_extension.dart';
import 'partials/suggestion_header_title.dart';

class SearchDelegateEmptySuggestions extends StatelessWidget {
  final SearchBloc controller;
  final void Function(String title) onTap;

  const SearchDelegateEmptySuggestions({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: controller,
      builder: (context, state) {
        List<String> suggestions = [];
        List<String> history = [];

        if (state is SearchLoading) return const LinearProgressIndicator();

        if (state is SearchSuggestionsLoaded) {
          suggestions = state.suggestions;
          history = state.history;
        }

        return Scrollbar(
          child: ListView(
            children: [
              if (history.isNotEmpty) ...[
                SuggestionHeaderTitle(
                  isHistory: true,
                  title: context.l10n.recentSearches,
                  onPressed: () {
                    debugPrint('clear history pressed');
                    controller.add(ClearHistory());
                  },
                ),
                ...history.map(
                  (title) => ListTile(
                    leading: const Icon(Icons.history),
                    title: Text(title),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        controller.add(DeleteFromHistory(title: title));
                      },
                    ),
                    onTap: () => onTap(title),
                    contentPadding: context.padding.pL24R16,
                  ),
                ),
                const Divider(),
              ],
              if (suggestions.isNotEmpty) ...[
                SuggestionHeaderTitle(title: context.l10n.suggestions),
                ...suggestions.map(
                  (title) => ListTile(
                    title: Text(title),
                    onTap: () => onTap(title),
                    contentPadding: context.padding.pH24,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
