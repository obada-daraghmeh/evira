// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(field) => "Enter your ${field}";

  static String m1(filed) => "${filed} field is required";

  static String m2(filed) => "This ${filed} is already taken";

  static String m3(filed) => "Enter a valid ${filed}";

  static String m4(filed, length) =>
      "${filed} must be at least ${length} characters long";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enterYourField": m0,
        "filedIsRequired": m1,
        "filedNotUnique": m2,
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot the password?"),
        "invalidField": m3,
        "invalidName": MessageLookupByLibrary.simpleMessage(
            "Name can only contain letters and spaces"),
        "invalidPassword": MessageLookupByLibrary.simpleMessage(
            "Password must contain uppercase, lowercase, number, and special character"),
        "minimumLength": m4,
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("or continue with"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "reEnterYourPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter your password"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signInPrompt":
            MessageLookupByLibrary.simpleMessage("Don’t have an account?"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Login to your\nAccount"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "signUpPrompt":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Create your\nAccount")
      };
}
