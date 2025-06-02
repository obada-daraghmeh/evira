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
