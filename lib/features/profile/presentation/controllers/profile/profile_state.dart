part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;
  const ProfileLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class ProfileAvatarUpdated extends ProfileState {
  final String url;
  const ProfileAvatarUpdated(this.url);

  @override
  List<Object> get props => [url];
}

class ProfileFailure extends ProfileState {
  final String message;
  const ProfileFailure(this.message);

  @override
  List<Object> get props => [message];
}
