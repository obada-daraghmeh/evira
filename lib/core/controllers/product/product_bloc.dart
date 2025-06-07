import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../features/product/domain/usecases/fetch_products.dart';
import '../../errors/failures/failure.dart';
import '../../services/get_it_service.dart';
import '../../shared/features/classes/usecase.dart';
import '../../shared/features/entities/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    await _fetchProducts(
      useCaseCall: () => getIt<FetchProductsUseCase>().call(NoParams()),
      emit: emit,
    );
  }

  Future<void> _fetchProducts({
    required Future<Either<Failure, List<Product>>> Function() useCaseCall,
    required Emitter<ProductState> emit,
  }) async {
    emit(ProductLoading());
    final response = await useCaseCall();
    response.fold(
      (failure) => emit(ProductFailure(failure.message)),
      (products) => emit(ProductLoaded(products)),
    );
  }
}
