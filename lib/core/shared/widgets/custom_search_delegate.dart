import 'dart:async';

import 'package:flutter/material.dart';

import '../../controllers/search/search_bloc.dart';
import '../../services/get_it_service.dart';
import 'partials/search_delegate/search_delegate_actions.dart';
import 'partials/search_delegate/search_delegate_empty_suggestions.dart';
import 'partials/search_delegate/search_delegate_leading.dart';
import 'partials/search_delegate/search_delegate_results.dart';
import 'partials/search_delegate/search_delegate_suggestions.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchBloc controller = getIt<SearchBloc>()..add(FetchSuggestions());

  Timer? _debounce;
  void _onQueryChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (query.isEmpty) {
        controller.add(FetchSuggestions());
      } else {
        controller.add(SearchByTitle(title: query));
      }
    });
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return SearchDelegateLeading(onPressed: () => close(context, null));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      SearchDelegateActions(
        query: query,
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);

    if (query.isEmpty) {
      return SearchDelegateEmptySuggestions(
        controller: controller,
        onTap: (title) {
          query = title;
          showResults(context);
        },
      );
    }

    return SearchDelegateSuggestions(
      query: query,
      controller: controller,
      onTap: (title) {
        query = title;
        showResults(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchDelegateResults(controller: controller, query: query);
  }

  @override
  void showResults(BuildContext context) {
    if (query.isNotEmpty) {
      controller.add(AddToHistory(title: query));
      controller.add(SearchByTitle(title: query));
    }
    super.showResults(context);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.close();
    super.dispose();
  }
}
