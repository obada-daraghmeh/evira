import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/shared/features/models/user_model.dart';

class AuthenticatedUser {
  final Session session;
  final UserModel user;

  const AuthenticatedUser({required this.session, required this.user});
}
