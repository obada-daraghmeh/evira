import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/controllers/auth_status/auth_status_cubit.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/shared/features/entities/user.dart';
import '../../../domain/usecases/update_profile.dart';
import '../../../domain/usecases/update_profile_avatar.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<EditProfile>(_onEditProfile);
    on<UpdateProfileAvatar>(_onUpdateProfileAvatar);
  }

  Future<void> _onEditProfile(
    EditProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final response = await getIt<UpdateProfileUseCase>().call(event.username);
    response.fold((failure) => emit(ProfileFailure(failure.message)), (user) {
      getIt<AuthStatusCubit>().updateAuthStatus(user);
      emit(ProfileLoaded(user));
    });
  }

  Future<void> _onUpdateProfileAvatar(
    UpdateProfileAvatar event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final response = await getIt<UpdateProfileAvatarUseCase>().call(
      UpdateProfileAvatarParams(userId: event.userId, file: event.file),
    );
    response.fold((failure) => emit(ProfileFailure(failure.message)), (url) {
      emit(ProfileAvatarUpdated(url));
    });
  }
}
