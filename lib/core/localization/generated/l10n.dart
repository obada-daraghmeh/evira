// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class FlutterIntl {
  FlutterIntl();

  static FlutterIntl? _current;

  static FlutterIntl get current {
    assert(_current != null,
        'No instance of FlutterIntl was loaded. Try to initialize the FlutterIntl delegate before accessing FlutterIntl.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<FlutterIntl> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = FlutterIntl();
      FlutterIntl._current = instance;

      return instance;
    });
  }

  static FlutterIntl of(BuildContext context) {
    final instance = FlutterIntl.maybeOf(context);
    assert(instance != null,
        'No instance of FlutterIntl present in the widget tree. Did you add FlutterIntl.delegate in localizationsDelegates?');
    return instance!;
  }

  static FlutterIntl? maybeOf(BuildContext context) {
    return Localizations.of<FlutterIntl>(context, FlutterIntl);
  }

  /// `Login to your\nAccount`
  String get signInTitle {
    return Intl.message(
      'Login to your\nAccount',
      name: 'signInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your {field}`
  String enterYourField(Object field) {
    return Intl.message(
      'Enter your $field',
      name: 'enterYourField',
      desc: '',
      args: [field],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `{filed} field is required`
  String filedIsRequired(Object filed) {
    return Intl.message(
      '$filed field is required',
      name: 'filedIsRequired',
      desc: '',
      args: [filed],
    );
  }

  /// `Enter a valid {filed}`
  String invalidField(Object filed) {
    return Intl.message(
      'Enter a valid $filed',
      name: 'invalidField',
      desc: '',
      args: [filed],
    );
  }

  /// `{filed} must be at least {length} characters long`
  String minimumLength(Object filed, Object length) {
    return Intl.message(
      '$filed must be at least $length characters long',
      name: 'minimumLength',
      desc: '',
      args: [filed, length],
    );
  }

  /// `Password must contain uppercase, lowercase, number, and special character`
  String get invalidPassword {
    return Intl.message(
      'Password must contain uppercase, lowercase, number, and special character',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Name can only contain letters and spaces`
  String get invalidName {
    return Intl.message(
      'Name can only contain letters and spaces',
      name: 'invalidName',
      desc: '',
      args: [],
    );
  }

  /// `This {filed} is already taken`
  String filedNotUnique(Object filed) {
    return Intl.message(
      'This $filed is already taken',
      name: 'filedNotUnique',
      desc: '',
      args: [filed],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Forgot the password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot the password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get signInPrompt {
    return Intl.message(
      'Don’t have an account?',
      name: 'signInPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get orContinueWith {
    return Intl.message(
      'or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Create your\nAccount`
  String get signUpTitle {
    return Intl.message(
      'Create your\nAccount',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get reEnterYourPassword {
    return Intl.message(
      'Re-enter your password',
      name: 'reEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signUpPrompt {
    return Intl.message(
      'Already have an account?',
      name: 'signUpPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Sign-in failed. Please check your credentials or try again later.`
  String get signInFailedMessage {
    return Intl.message(
      'Sign-in failed. Please check your credentials or try again later.',
      name: 'signInFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Unable to retrieve user data. Please try again.`
  String get fetchUserFailedMessage {
    return Intl.message(
      'Unable to retrieve user data. Please try again.',
      name: 'fetchUserFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Account creation failed. Please check your email to confirm your account or try again later.`
  String get accountCreationFailedMessage {
    return Intl.message(
      'Account creation failed. Please check your email to confirm your account or try again later.',
      name: 'accountCreationFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please sign in again.`
  String get sessionExpiredMessage {
    return Intl.message(
      'Your session has expired. Please sign in again.',
      name: 'sessionExpiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get unknownErrorMessage {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'unknownErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Good {timeOfDay} 👋`
  String goodTimeOfDay(Object timeOfDay) {
    return Intl.message(
      'Good $timeOfDay 👋',
      name: 'goodTimeOfDay',
      desc: '',
      args: [timeOfDay],
    );
  }

  /// `Morning`
  String get morning {
    return Intl.message(
      'Morning',
      name: 'morning',
      desc: '',
      args: [],
    );
  }

  /// `Afternoon`
  String get afternoon {
    return Intl.message(
      'Afternoon',
      name: 'afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Special Offers`
  String get specialOffers {
    return Intl.message(
      'Special Offers',
      name: 'specialOffers',
      desc: '',
      args: [],
    );
  }

  /// `Most popular`
  String get mostPopular {
    return Intl.message(
      'Most popular',
      name: 'mostPopular',
      desc: '',
      args: [],
    );
  }

  /// `₪{price}`
  String priceInILS(Object price) {
    return Intl.message(
      '₪$price',
      name: 'priceInILS',
      desc: '',
      args: [price],
    );
  }

  /// `{count} sold`
  String countSold(Object count) {
    return Intl.message(
      '$count sold',
      name: 'countSold',
      desc: '',
      args: [count],
    );
  }

  /// `{discountPercent}%`
  String discountPercent(Object discountPercent) {
    return Intl.message(
      '$discountPercent%',
      name: 'discountPercent',
      desc: '',
      args: [discountPercent],
    );
  }

  /// `({count} reviews)`
  String countReviews(Object count) {
    return Intl.message(
      '($count reviews)',
      name: 'countReviews',
      desc: '',
      args: [count],
    );
  }

  /// `Still empty — but your next great find is closer than you think.`
  String get emptyProductMsg {
    return Intl.message(
      'Still empty — but your next great find is closer than you think.',
      name: 'emptyProductMsg',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message(
      'Total Price',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message(
      'Add to Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Sizes`
  String get sizes {
    return Intl.message(
      'Sizes',
      name: 'sizes',
      desc: '',
      args: [],
    );
  }

  /// `Colors`
  String get colors {
    return Intl.message(
      'Colors',
      name: 'colors',
      desc: '',
      args: [],
    );
  }

  /// `Less`
  String get less {
    return Intl.message(
      'Less',
      name: 'less',
      desc: '',
      args: [],
    );
  }

  /// `Read more`
  String get readMore {
    return Intl.message(
      'Read more',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Size = {size}`
  String sizeSize(Object size) {
    return Intl.message(
      'Size = $size',
      name: 'sizeSize',
      desc: '',
      args: [size],
    );
  }

  /// `Your cart is empty — time to add something you love!`
  String get emptyCartMsg {
    return Intl.message(
      'Your cart is empty — time to add something you love!',
      name: 'emptyCartMsg',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get myCart {
    return Intl.message(
      'My Cart',
      name: 'myCart',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Great choice! It’s in your cart 🎉`
  String get cartSuccessMsg {
    return Intl.message(
      'Great choice! It’s in your cart 🎉',
      name: 'cartSuccessMsg',
      desc: '',
      args: [],
    );
  }

  /// `Remove From Cart?`
  String get removeFromCart {
    return Intl.message(
      'Remove From Cart?',
      name: 'removeFromCart',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message(
      'Security',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Theme Mode`
  String get themeMode {
    return Intl.message(
      'Theme Mode',
      name: 'themeMode',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenter {
    return Intl.message(
      'Help Center',
      name: 'helpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get inviteFriends {
    return Intl.message(
      'Invite Friends',
      name: 'inviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `{title} updated successfully`
  String titleUpdatedSuccessfully(Object title) {
    return Intl.message(
      '$title updated successfully',
      name: 'titleUpdatedSuccessfully',
      desc: '',
      args: [title],
    );
  }

  /// `Avatar`
  String get avatar {
    return Intl.message(
      'Avatar',
      name: 'avatar',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout of your account?`
  String get logoutHint {
    return Intl.message(
      'Are you sure you want to logout of your account?',
      name: 'logoutHint',
      desc: '',
      args: [],
    );
  }

  /// `Change avatar`
  String get changeAvatar {
    return Intl.message(
      'Change avatar',
      name: 'changeAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get recent {
    return Intl.message(
      'Recent',
      name: 'recent',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clearAll {
    return Intl.message(
      'Clear All',
      name: 'clearAll',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResultsFound {
    return Intl.message(
      'No results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResultsFoundTitle {
    return Intl.message(
      'No results found',
      name: 'noResultsFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `We couldn’t find anything matching your search. Try a different keyword.`
  String get noResultsFoundSubtitle {
    return Intl.message(
      'We couldn’t find anything matching your search. Try a different keyword.',
      name: 'noResultsFoundSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `No matching suggestions were found\nfor `
  String get noSuggestionsMatch {
    return Intl.message(
      'No matching suggestions were found\nfor ',
      name: 'noSuggestionsMatch',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get suggestions {
    return Intl.message(
      'Suggestions',
      name: 'suggestions',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<FlutterIntl> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<FlutterIntl> load(Locale locale) => FlutterIntl.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
