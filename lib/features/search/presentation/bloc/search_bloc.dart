import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../domain/usecases/search_by_title.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchByTitle>(_onSearchByTitle);
  }

  Future<void> _onSearchByTitle(
    SearchByTitle event,
    Emitter<SearchState> emit,
  ) async {
    final title = event.title.trim();
    if (title.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    final response = await getIt<SearchByTitleUseCase>().call(title);
    response.fold(
      (failure) => emit(SearchFailure(failure.message)),
      (products) => emit(SearchLoaded(products)),
    );
  }
}
