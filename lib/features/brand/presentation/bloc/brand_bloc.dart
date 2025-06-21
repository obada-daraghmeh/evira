import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../../domain/entities/brand.dart';
import '../../domain/usecases/fetch_brands.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  BrandBloc() : super(BrandInitial()) {
    on<FetchBrands>(_onFetchBrands);
  }

  Future<void> _onFetchBrands(
    FetchBrands event,
    Emitter<BrandState> emit,
  ) async {
    emit(BrandLoading());
    final response = await getIt<FetchBrandsUseCase>().call(NoParams());
    response.fold(
      (failure) => emit(BrandFailure(failure.message)),
      (brands) => emit(BrandLoaded(brands)),
    );
  }
}
