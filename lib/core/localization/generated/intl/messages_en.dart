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

  static String m0(attribute, value) => "${attribute} = ${value}";

  static String m1(itemsCount) =>
      "${Intl.plural(itemsCount, one: '1 item', other: '${itemsCount} items')}";

  static String m2(count) => "(${count} reviews)";

  static String m3(count) => "${count} sold";

  static String m4(discountPercent) => "${discountPercent}%";

  static String m5(field) => "Enter your ${field}";

  static String m6(filed) => "${filed} field is required";

  static String m7(filed) => "This ${filed} is already taken";

  static String m8(timeOfDay) => "Good ${timeOfDay} 👋";

  static String m9(filed) => "Enter a valid ${filed}";

  static String m10(filed, length) =>
      "${filed} must be at least ${length} characters long";

  static String m11(price) => "₪${price}";

  static String m12(attribute) => "Select ${attribute}";

  static String m13(title) => "${title} updated successfully";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountCreationFailedMessage": MessageLookupByLibrary.simpleMessage(
            "Account creation failed. Please check your email to confirm your account or try again later."),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addToCart": MessageLookupByLibrary.simpleMessage("Add to Cart"),
        "addToWishlist":
            MessageLookupByLibrary.simpleMessage("Add to Wishlist"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "afternoon": MessageLookupByLibrary.simpleMessage("Afternoon"),
        "attribute": MessageLookupByLibrary.simpleMessage("Attribute"),
        "attributeValue": m0,
        "avatar": MessageLookupByLibrary.simpleMessage("Avatar"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "cartItemCount": m1,
        "cartSuccessMsg": MessageLookupByLibrary.simpleMessage(
            "Great choice! It’s in your cart 🎉"),
        "changeAvatar": MessageLookupByLibrary.simpleMessage("Change avatar"),
        "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "clearAll": MessageLookupByLibrary.simpleMessage("Clear All"),
        "color": MessageLookupByLibrary.simpleMessage("Color"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "countReviews": m2,
        "countSold": m3,
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "details": MessageLookupByLibrary.simpleMessage("Details"),
        "discountPercent": m4,
        "editProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emptyCartMsg": MessageLookupByLibrary.simpleMessage(
            "Your cart is empty — time to add something you love!"),
        "emptyProductMsg": MessageLookupByLibrary.simpleMessage(
            "Still empty — but your next great find is closer than you think."),
        "emptyWishlist": MessageLookupByLibrary.simpleMessage(
            "Your wishlist is empty — time to add something you love!"),
        "enterYourField": m5,
        "fetchUserFailedMessage": MessageLookupByLibrary.simpleMessage(
            "Unable to retrieve user data. Please try again."),
        "filedIsRequired": m6,
        "filedNotUnique": m7,
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot the password?"),
        "goodTimeOfDay": m8,
        "helpCenter": MessageLookupByLibrary.simpleMessage("Help Center"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "invalidField": m9,
        "invalidName": MessageLookupByLibrary.simpleMessage(
            "Name can only contain letters and spaces"),
        "invalidPassword": MessageLookupByLibrary.simpleMessage(
            "Password must contain uppercase, lowercase, number, and special character"),
        "inviteFriends": MessageLookupByLibrary.simpleMessage("Invite Friends"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "less": MessageLookupByLibrary.simpleMessage("Less"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "logoutHint": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to logout of your account?"),
        "minimumLength": m10,
        "morning": MessageLookupByLibrary.simpleMessage("Morning"),
        "mostPopular": MessageLookupByLibrary.simpleMessage("Most popular"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "noResultsFoundSubtitle": MessageLookupByLibrary.simpleMessage(
            "We couldn’t find anything matching your search. Try a different keyword."),
        "noResultsFoundTitle":
            MessageLookupByLibrary.simpleMessage("No results found"),
        "noSuggestionsMatch": MessageLookupByLibrary.simpleMessage(
            "No matching suggestions were found\nfor "),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("or continue with"),
        "orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "payments": MessageLookupByLibrary.simpleMessage("Payments"),
        "pleaseSelectSizeAndColor": MessageLookupByLibrary.simpleMessage(
            "Please select size and color"),
        "priceInILS": m11,
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "reEnterYourPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter your password"),
        "readMore": MessageLookupByLibrary.simpleMessage("Read more"),
        "recent": MessageLookupByLibrary.simpleMessage("Recent"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "remove": MessageLookupByLibrary.simpleMessage("Remove"),
        "removeFromCart":
            MessageLookupByLibrary.simpleMessage("Remove From Cart?"),
        "removeFromWishlist":
            MessageLookupByLibrary.simpleMessage("Remove From Wishlist"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "security": MessageLookupByLibrary.simpleMessage("Security"),
        "seeAll": MessageLookupByLibrary.simpleMessage("See all"),
        "selectAttribute": m12,
        "sessionExpiredMessage": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please sign in again."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
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
        "size": MessageLookupByLibrary.simpleMessage("Size"),
        "specialOffers": MessageLookupByLibrary.simpleMessage("Special Offers"),
        "suggestions": MessageLookupByLibrary.simpleMessage("Suggestions"),
        "themeMode": MessageLookupByLibrary.simpleMessage("Theme Mode"),
        "titleUpdatedSuccessfully": m13,
        "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price"),
        "unknownErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Something went wrong. Please try again."),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "value": MessageLookupByLibrary.simpleMessage("Value"),
        "wallet": MessageLookupByLibrary.simpleMessage("Wallet"),
        "wishlist": MessageLookupByLibrary.simpleMessage("Wishlist")
      };
}
