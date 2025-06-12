import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/search/domain/usecases/add_to_history.dart';
import '../../../features/search/domain/usecases/clear_history.dart';
import '../../../features/search/domain/usecases/delete_from_history.dart';
import '../../../features/search/domain/usecases/fetch_history.dart';
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
    on<AddToHistory>(_onAddToHistory);
    on<DeleteFromHistory>(_onDeleteFromHistory);
    on<ClearHistory>(_onClearHistory);
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
      (failure) => emit(SearchFailure(message: failure.message)),
      (products) => emit(SearchResultsLoaded(products: products)),
    );
  }

  Future<void> _onFetchSuggestions(
    FetchSuggestions event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    final historyResponse = await getIt<FetchHistoryUseCase>().call(NoParams());
    final suggestionsResponse = await getIt<FetchSuggestionsUseCase>().call(
      NoParams(),
    );

    final history = historyResponse.getRight().toNullable();
    final suggestions = suggestionsResponse.getRight().toNullable();

    if (history == null) {
      final failure = historyResponse.getLeft().toNullable();
      emit(SearchFailure(message: failure?.message ?? 'Unknown error'));
      return;
    }

    if (suggestions == null) {
      final failure = suggestionsResponse.getLeft().toNullable();
      emit(SearchFailure(message: failure?.message ?? 'Unknown error'));
      return;
    }

    emit(SearchSuggestionsLoaded(suggestions: suggestions, history: history));
  }

  Future<void> _onAddToHistory(
    AddToHistory event,
    Emitter<SearchState> emit,
  ) async {
    final response = await getIt<AddToHistoryUseCase>().call(event.title);
    response.fold(
      (failure) => emit(SearchFailure(message: failure.message)),
      (_) {},
    );
  }

  Future<void> _onDeleteFromHistory(
    DeleteFromHistory event,
    Emitter<SearchState> emit,
  ) async {
    final result = await getIt<DeleteFromHistoryUseCase>().call(event.title);
    await result.fold(
      (failure) async => emit(SearchFailure(message: failure.message)),
      (_) => _emitSuggestionsWithHistory(emit),
    );
  }

  Future<void> _onClearHistory(
    ClearHistory event,
    Emitter<SearchState> emit,
  ) async {
    final result = await getIt<ClearHistoryUseCase>().call(NoParams());
    await result.fold(
      (failure) async => emit(SearchFailure(message: failure.message)),
      (_) => _emitSuggestionsWithHistory(emit, clearHistory: true),
    );
  }

  Future<void> _emitSuggestionsWithHistory(
    Emitter<SearchState> emit, {
    bool clearHistory = false,
  }) async {
    final List<String> history = clearHistory
        ? const <String>[]
        : await getIt<FetchHistoryUseCase>()
              .call(NoParams())
              .then((res) => res.getRight().toNullable() ?? const <String>[]);

    final List<String> suggestions = await getIt<FetchSuggestionsUseCase>()
        .call(NoParams())
        .then((res) => res.getRight().toNullable() ?? const <String>[]);

    emit(SearchSuggestionsLoaded(suggestions: suggestions, history: history));
  }
}
