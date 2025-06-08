part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchByTitle extends SearchEvent {
  final String title;
  const SearchByTitle({required this.title});

  @override
  List<Object> get props => [title];
}

class FetchSuggestions extends SearchEvent {}
