import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../domain/usecases/fetch_products_by_category.dart';

part 'category_products_event.dart';
part 'category_products_state.dart';

class CategoryProductsBloc
    extends Bloc<CategoryProductsEvent, CategoryProductsState> {
  CategoryProductsBloc() : super(CategoryProductsInitial()) {
    on<ProductFetchedByCategory>(_onFetchedByCategory);
  }

  Future<void> _onFetchedByCategory(
    ProductFetchedByCategory event,
    Emitter<CategoryProductsState> emit,
  ) async {
    emit(CategoryProductsLoading());
    final response = await getIt<FetchProductsByCategoryUseCase>().call(
      event.categoryId,
    );
    response.fold(
      (failure) => emit(CategoryProductsFailure(failure.message)),
      (products) => emit(CategoryProductsLoaded(products)),
    );
  }
}
