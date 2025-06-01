import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/controllers/auth_status/auth_status_cubit.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../../../../core/shared/features/entities/user.dart';
import '../../domain/usecases/current_user.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_out.dart';
import '../../domain/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthSignOut>(_onAuthSignOut);
    on<AuthCheckStatus>(_onAuthCheckStatus);
  }

  Future<void> _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    await _handleAuthAction(
      emit: emit,
      useCase: getIt<SignUpUseCase>(),
      params: SignUpParams(
        username: event.username,
        email: event.email,
        password: event.password,
      ),
    );
  }

  Future<void> _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    await _handleAuthAction(
      emit: emit,
      useCase: getIt<SignInUseCase>(),
      params: SignInParams(email: event.email, password: event.password),
    );
  }

  Future<void> _handleAuthAction<T>({
    required Emitter<AuthState> emit,
    required UseCase<User, T> useCase,
    required T params,
  }) async {
    emit(AuthLoading());
    final response = await useCase.call(params);
    response.fold((failure) => emit(AuthFailure(failure.message)), (user) {
      getIt<AuthStatusCubit>().updateAuthStatus(user);
      emit(Authenticated(user));
    });
  }

  Future<void> _onAuthCheckStatus(
    AuthCheckStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await getIt<CurrentUserUseCase>().call(NoParams());

    response.fold((failure) => emit(Unauthenticated()), (user) {
      if (user != null) {
        getIt<AuthStatusCubit>().updateAuthStatus(user);
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    });
  }

  Future<void> _onAuthSignOut(
    AuthSignOut event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await getIt<SignOutUseCase>().call(NoParams());
    response.fold((failure) => emit(AuthFailure(failure.message)), (_) {
      getIt<AuthStatusCubit>().updateAuthStatus(null);
      emit(Unauthenticated());
    });
  }
}
