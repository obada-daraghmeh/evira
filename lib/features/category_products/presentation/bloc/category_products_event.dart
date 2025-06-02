part of 'category_products_bloc.dart';

sealed class CategoryProductsEvent extends Equatable {
  const CategoryProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductFetchedByCategory extends CategoryProductsEvent {
  final String categoryId;
  const ProductFetchedByCategory({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}
