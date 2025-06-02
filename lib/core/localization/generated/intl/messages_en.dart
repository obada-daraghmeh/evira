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

  static String m0(count) => "(${count} reviews)";

  static String m1(count) => "${count} sold";

  static String m2(discountPercent) => "${discountPercent}%";

  static String m3(field) => "Enter your ${field}";

  static String m4(filed) => "${filed} field is required";

  static String m5(filed) => "This ${filed} is already taken";

  static String m6(timeOfDay) => "Good ${timeOfDay} 👋";

  static String m7(filed) => "Enter a valid ${filed}";

  static String m8(filed, length) =>
      "${filed} must be at least ${length} characters long";

  static String m9(price) => "₪${price}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountCreationFailedMessage": MessageLookupByLibrary.simpleMessage(
            "Account creation failed. Please check your email to confirm your account or try again later."),
        "afternoon": MessageLookupByLibrary.simpleMessage("Afternoon"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "countReviews": m0,
        "countSold": m1,
        "discountPercent": m2,
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enterYourField": m3,
        "fetchUserFailedMessage": MessageLookupByLibrary.simpleMessage(
            "Unable to retrieve user data. Please try again."),
        "filedIsRequired": m4,
        "filedNotUnique": m5,
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot the password?"),
        "goodTimeOfDay": m6,
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "invalidField": m7,
        "invalidName": MessageLookupByLibrary.simpleMessage(
            "Name can only contain letters and spaces"),
        "invalidPassword": MessageLookupByLibrary.simpleMessage(
            "Password must contain uppercase, lowercase, number, and special character"),
        "minimumLength": m8,
        "morning": MessageLookupByLibrary.simpleMessage("Morning"),
        "mostPopular": MessageLookupByLibrary.simpleMessage("Most popular"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("or continue with"),
        "orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "priceInILS": m9,
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "reEnterYourPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter your password"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "seeAll": MessageLookupByLibrary.simpleMessage("See all"),
        "sessionExpiredMessage": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please sign in again."),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signInFailedMessage": MessageLookupByLibrary.simpleMessage(
            "Sign-in failed. Please check your credentials or try again later."),
        "signInPrompt":
            MessageLookupByLibrary.simpleMessage("Don’t have an account?"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Login to your\nAccount"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "signUpPrompt":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Create your\nAccount"),
        "specialOffers": MessageLookupByLibrary.simpleMessage("Special Offers"),
        "unknownErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Something went wrong. Please try again."),
        "wallet": MessageLookupByLibrary.simpleMessage("Wallet"),
        "wishlist": MessageLookupByLibrary.simpleMessage("Wishlist")
      };
}
