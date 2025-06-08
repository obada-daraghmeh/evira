import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/search/domain/usecases/fetch_suggestions.dart';
import '../../../features/search/domain/usecases/search_by_title.dart';
import '../../services/get_it_service.dart';
import '../../shared/features/classes/usecase.dart';
import '../../shared/features/entities/product.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchByTitle>(_onSearchByTitle);
    on<FetchSuggestions>(_onFetchSuggestions);
  }

  Future<void> _onFetchSuggestions(
    FetchSuggestions event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    final response = await getIt<FetchSuggestionsUseCase>().call(NoParams());
    response.fold(
      (failure) => emit(SearchFailure(failure.message)),
      (suggestions) => emit(SearchLoaded(suggestions)),
    );
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
