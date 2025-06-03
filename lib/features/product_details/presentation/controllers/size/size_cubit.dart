import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'size_state.dart';

class SizeCubit extends Cubit<SizeState> {
  SizeCubit() : super(SizeInitial());

  void selectSize(int index) => emit(SizeSelected(index));
}
