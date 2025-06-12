part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuggestionsLoaded extends SearchState {
  final List<String> suggestions;
  final List<String> history;

  const SearchSuggestionsLoaded({
    this.suggestions = const [],
    this.history = const [],
  });

  @override
  List<Object?> get props => [suggestions, history];
}

class SearchResultsLoaded extends SearchState {
  final List<Product> products;
  const SearchResultsLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

class SearchFailure extends SearchState {
  final String message;
  const SearchFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
