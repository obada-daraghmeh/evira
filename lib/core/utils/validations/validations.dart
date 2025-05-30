import '../../localization/generated/l10n.dart';

final l10n = FlutterIntl.current;

class Validations {
  static String? email(String? value) {
    final pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    if (value == null || value.trim().isEmpty) {
      return l10n.filedIsRequired(l10n.email);
    }

    if (!RegExp(pattern).hasMatch(value)) {
      return l10n.invalidField(l10n.email);
    }

    return null;
  }

  static String? password(String? value) {
    final pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

    if (value == null || value.trim().isEmpty) {
      return l10n.filedIsRequired(l10n.password);
    }

    if (value.length < 8) {
      return l10n.minimumLength(l10n.password, 8);
    }

    if (!RegExp(pattern).hasMatch(value)) {
      return l10n.invalidPassword;
    }

    return null;
  }

  static String? confirmPassword(String? value, String? originalPassword) {
    if (value == null || value.trim().isEmpty) {
      return l10n.filedIsRequired(l10n.confirmPassword);
    }

    if (value != originalPassword) {
      return l10n.passwordsDoNotMatch;
    }

    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return l10n.filedIsRequired(l10n.name);
    }

    if (value.length < 3) {
      return l10n.minimumLength(l10n.name, 3);
    }

    final namePattern = r"^[a-zA-Z\s]+$";
    if (!RegExp(namePattern).hasMatch(value)) {
      return l10n.invalidName;
    }
    return null;
  }

  static Future<String?> isNameUnique(String? value) async {
    // final response =
    //     await serviceLocator<SupabaseClient>()
    //         .from(SupabaseConst.profilesTable)
    //         .select('id')
    //         .eq('name', value!)
    //         .maybeSingle();

    // if (response != null) {
    //   return l10n.filedNotUnique(l10n.name);
    // }

    return null;
  }
}
