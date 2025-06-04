part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class EditProfile extends ProfileEvent {
  final String username;
  const EditProfile({required this.username});

  @override
  List<Object> get props => [username];
}

class UpdateProfileAvatar extends ProfileEvent {
  final String userId;
  final File file;

  const UpdateProfileAvatar({required this.userId, required this.file});

  @override
  List<Object> get props => [userId, file];
}
