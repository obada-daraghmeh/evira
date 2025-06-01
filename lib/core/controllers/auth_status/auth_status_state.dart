part of 'auth_status_cubit.dart';

sealed class AuthStatusState extends Equatable {
  const AuthStatusState();

  @override
  List<Object> get props => [];
}

final class AuthStatusInitial extends AuthStatusState {}

final class Authenticated extends AuthStatusState {
  final User user;
  const Authenticated({required this.user});
}

final class Unauthenticated extends AuthStatusState {}
