import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/auth_status/auth_status_cubit.dart';
import '../../shared/features/entities/user.dart';

extension AuthStateExtension on BuildContext {
  User get currentUser => (read<AuthStatusCubit>().state as Authenticated).user;
}
