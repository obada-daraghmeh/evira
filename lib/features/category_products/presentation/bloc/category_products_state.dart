part of 'category_products_bloc.dart';

sealed class CategoryProductsState extends Equatable {
  const CategoryProductsState();

  @override
  List<Object> get props => [];
}

final class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsLoaded extends CategoryProductsState {
  final List<Product> products;
  const CategoryProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class CategoryProductsFailure extends CategoryProductsState {
  final String message;
  const CategoryProductsFailure(this.message);

  @override
  List<Object> get props => [message];
}
