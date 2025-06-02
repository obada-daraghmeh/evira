import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/category/domain/usecases/fetch_categories.dart';
import '../../services/get_it_service.dart';
import '../../shared/features/classes/usecase.dart';
import '../../shared/features/entities/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<FetchCategories>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(
    FetchCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final response = await getIt<FetchCategoriesUseCase>().call(NoParams());
    response.fold(
      (failure) => emit(CategoryFailure(failure.message)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }
}
