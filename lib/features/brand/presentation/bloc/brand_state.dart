part of 'brand_bloc.dart';

sealed class BrandState extends Equatable {
  const BrandState();

  @override
  List<Object> get props => [];
}

final class BrandInitial extends BrandState {}

class BrandLoading extends BrandState {}

class BrandLoaded extends BrandState {
  final List<Brand> brands;
  const BrandLoaded(this.brands);

  @override
  List<Object> get props => [brands];
}

class BrandFailure extends BrandState {
  final String message;
  const BrandFailure(this.message);

  @override
  List<Object> get props => [message];
}
