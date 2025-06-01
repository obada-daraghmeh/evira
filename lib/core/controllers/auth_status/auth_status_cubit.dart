import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/features/entities/user.dart';

part 'auth_status_state.dart';

class AuthStatusCubit extends Cubit<AuthStatusState> {
  AuthStatusCubit() : super(AuthStatusInitial());

  void updateAuthStatus(User? user) {
    user == null ? emit(Unauthenticated()) : emit(Authenticated(user: user));
  }
}
