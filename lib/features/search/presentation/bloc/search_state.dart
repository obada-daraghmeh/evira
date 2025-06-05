part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Product> products;
  const SearchLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class SearchFailure extends SearchState {
  final String message;
  const SearchFailure(this.message);

  @override
  List<Object> get props => [message];
}
