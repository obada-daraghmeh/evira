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

  static String m10(size) => "Size = ${size}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountCreationFailedMessage": MessageLookupByLibrary.simpleMessage(
            "Account creation failed. Please check your email to confirm your account or try again later."),
        "addToCart": MessageLookupByLibrary.simpleMessage("Add to Cart"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "afternoon": MessageLookupByLibrary.simpleMessage("Afternoon"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "cartSuccessMsg": MessageLookupByLibrary.simpleMessage(
            "Great choice! It’s in your cart 🎉"),
        "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
        "color": MessageLookupByLibrary.simpleMessage("Color"),
        "colors": MessageLookupByLibrary.simpleMessage("Colors"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "countReviews": m0,
        "countSold": m1,
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "discountPercent": m2,
        "editProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emptyCartMsg": MessageLookupByLibrary.simpleMessage(
            "Your cart is empty — time to add something you love!"),
        "emptyProductMsg": MessageLookupByLibrary.simpleMessage(
            "Still empty — but your next great find is closer than you think."),
        "enterYourField": m3,
        "fetchUserFailedMessage": MessageLookupByLibrary.simpleMessage(
            "Unable to retrieve user data. Please try again."),
        "filedIsRequired": m4,
        "filedNotUnique": m5,
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot the password?"),
        "goodTimeOfDay": m6,
        "helpCenter": MessageLookupByLibrary.simpleMessage("Help Center"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "invalidField": m7,
        "invalidName": MessageLookupByLibrary.simpleMessage(
            "Name can only contain letters and spaces"),
        "invalidPassword": MessageLookupByLibrary.simpleMessage(
            "Password must contain uppercase, lowercase, number, and special character"),
        "inviteFriends": MessageLookupByLibrary.simpleMessage("Invite Friends"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "less": MessageLookupByLibrary.simpleMessage("Less"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "minimumLength": m8,
        "morning": MessageLookupByLibrary.simpleMessage("Morning"),
        "mostPopular": MessageLookupByLibrary.simpleMessage("Most popular"),
        "myCart": MessageLookupByLibrary.simpleMessage("My Cart"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("or continue with"),
        "orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "payments": MessageLookupByLibrary.simpleMessage("Payments"),
        "priceInILS": m9,
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "reEnterYourPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter your password"),
        "readMore": MessageLookupByLibrary.simpleMessage("Read more"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "remove": MessageLookupByLibrary.simpleMessage("Remove"),
        "removeFromCart":
            MessageLookupByLibrary.simpleMessage("Remove From Cart?"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "security": MessageLookupByLibrary.simpleMessage("Security"),
        "seeAll": MessageLookupByLibrary.simpleMessage("See all"),
        "sessionExpiredMessage": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please sign in again."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
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
        "sizeSize": m10,
        "sizes": MessageLookupByLibrary.simpleMessage("Sizes"),
        "specialOffers": MessageLookupByLibrary.simpleMessage("Special Offers"),
        "themeMode": MessageLookupByLibrary.simpleMessage("Theme Mode"),
        "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price"),
        "unknownErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Something went wrong. Please try again."),
        "wallet": MessageLookupByLibrary.simpleMessage("Wallet"),
        "wishlist": MessageLookupByLibrary.simpleMessage("Wishlist")
      };
}
