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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get title {
    return Intl.message(
      'Hello',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `settings screen`
  String get settingsScreen {
    return Intl.message(
      'settings screen',
      name: 'settingsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Developed the {appleOne} & {appleTwo} microcomputers.`
  String wozniakBio(Object appleOne, Object appleTwo) {
    return Intl.message(
      'Developed the $appleOne & $appleTwo microcomputers.',
      name: 'wozniakBio',
      desc: '',
      args: [appleOne, appleTwo],
    );
  }

  /// `{count,plural, =0{No heroes yet} =1{1 hero} other{{count} heroes}}`
  String heroCount(num count) {
    return Intl.plural(
      count,
      zero: 'No heroes yet',
      one: '1 hero',
      other: '$count heroes',
      name: 'heroCount',
      desc: '',
      args: [count],
    );
  }

  /// `Your total is: {value}`
  String itemTotal(double value) {
    final NumberFormat valueNumberFormat = NumberFormat.currency(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      'Your total is: $valueString',
      name: 'itemTotal',
      desc: '',
      args: [valueString],
    );
  }

  /// `Born {date}`
  String heroBorn(DateTime date) {
    final DateFormat dateDateFormat = DateFormat.yMMMd(Intl.getCurrentLocale());
    final String dateString = dateDateFormat.format(date);

    return Intl.message(
      'Born $dateString',
      name: 'heroBorn',
      desc: '',
      args: [dateString],
    );
  }

  /// `Alan Turing`
  String get alanTuring {
    return Intl.message(
      'Alan Turing',
      name: 'alanTuring',
      desc: '',
      args: [],
    );
  }

  /// `Login successfully`
  String get loginSuccess {
    return Intl.message(
      'Login successfully',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Doctors`
  String get doctors {
    return Intl.message(
      'Doctors',
      name: 'doctors',
      desc: '',
      args: [],
    );
  }

  /// `Dentists`
  String get dentists {
    return Intl.message(
      'Dentists',
      name: 'dentists',
      desc: '',
      args: [],
    );
  }

  /// `Therapists`
  String get therapists {
    return Intl.message(
      'Therapists',
      name: 'therapists',
      desc: '',
      args: [],
    );
  }

  /// `Economics`
  String get economics {
    return Intl.message(
      'Economics',
      name: 'economics',
      desc: '',
      args: [],
    );
  }

  /// `Lawyers`
  String get lawyers {
    return Intl.message(
      'Lawyers',
      name: 'lawyers',
      desc: '',
      args: [],
    );
  }

  /// `Software Engineers`
  String get softwareEngineers {
    return Intl.message(
      'Software Engineers',
      name: 'softwareEngineers',
      desc: '',
      args: [],
    );
  }

  /// `Civil Engineers`
  String get civilEngineers {
    return Intl.message(
      'Civil Engineers',
      name: 'civilEngineers',
      desc: '',
      args: [],
    );
  }

  /// `Consultants List`
  String get consultantsList {
    return Intl.message(
      'Consultants List',
      name: 'consultantsList',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
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

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
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

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Shift Start`
  String get shiftStart {
    return Intl.message(
      'Shift Start',
      name: 'shiftStart',
      desc: '',
      args: [],
    );
  }

  /// `Shift End`
  String get shiftEnd {
    return Intl.message(
      'Shift End',
      name: 'shiftEnd',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio {
    return Intl.message(
      'Bio',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `Select any consultation`
  String get selectConsultation {
    return Intl.message(
      'Select any consultation',
      name: 'selectConsultation',
      desc: '',
      args: [],
    );
  }

  /// `REGISTER`
  String get register {
    return Intl.message(
      'REGISTER',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Register as`
  String get registerAs {
    return Intl.message(
      'Register as',
      name: 'registerAs',
      desc: '',
      args: [],
    );
  }

  /// `consultant`
  String get consultant {
    return Intl.message(
      'consultant',
      name: 'consultant',
      desc: '',
      args: [],
    );
  }

  /// `Register as`
  String get registerAsu {
    return Intl.message(
      'Register as',
      name: 'registerAsu',
      desc: '',
      args: [],
    );
  }

  /// `user`
  String get user {
    return Intl.message(
      'user',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Home Page`
  String get homePage {
    return Intl.message(
      'Home Page',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `Search a consultant`
  String get search {
    return Intl.message(
      'Search a consultant',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
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

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
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

  /// `TRANSFER`
  String get transfer {
    return Intl.message(
      'TRANSFER',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `Money Amount`
  String get moneyAmount {
    return Intl.message(
      'Money Amount',
      name: 'moneyAmount',
      desc: '',
      args: [],
    );
  }

  /// `Profile Details`
  String get profileDetails {
    return Intl.message(
      'Profile Details',
      name: 'profileDetails',
      desc: '',
      args: [],
    );
  }

  /// `date`
  String get date {
    return Intl.message(
      'date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `BOOK`
  String get book {
    return Intl.message(
      'BOOK',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Start`
  String get appointmentStart {
    return Intl.message(
      'Appointment Start',
      name: 'appointmentStart',
      desc: '',
      args: [],
    );
  }

  /// `email must not be empty`
  String get requiredEmail {
    return Intl.message(
      'email must not be empty',
      name: 'requiredEmail',
      desc: '',
      args: [],
    );
  }

  /// `invalid email format`
  String get emailFormat {
    return Intl.message(
      'invalid email format',
      name: 'emailFormat',
      desc: '',
      args: [],
    );
  }

  /// `password must not be empty`
  String get requiredPassword {
    return Intl.message(
      'password must not be empty',
      name: 'requiredPassword',
      desc: '',
      args: [],
    );
  }

  /// `min length is 6`
  String get passwordMin {
    return Intl.message(
      'min length is 6',
      name: 'passwordMin',
      desc: '',
      args: [],
    );
  }

  /// `min length is 3`
  String get min {
    return Intl.message(
      'min length is 3',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `invalid email or password`
  String get loginError {
    return Intl.message(
      'invalid email or password',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `logout successfully`
  String get logoutSuccess {
    return Intl.message(
      'logout successfully',
      name: 'logoutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `LOGOUT`
  String get logout {
    return Intl.message(
      'LOGOUT',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Application Language`
  String get applicationLanguage {
    return Intl.message(
      'Application Language',
      name: 'applicationLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Consultation Type`
  String get consultationType {
    return Intl.message(
      'Consultation Type',
      name: 'consultationType',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Cost`
  String get appointmentCost {
    return Intl.message(
      'Appointment Cost',
      name: 'appointmentCost',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Calendar`
  String get appointmentCalendar {
    return Intl.message(
      'Appointment Calendar',
      name: 'appointmentCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Date must not be empty`
  String get dateRequired {
    return Intl.message(
      'Date must not be empty',
      name: 'dateRequired',
      desc: '',
      args: [],
    );
  }

  /// `User is not found!`
  String get userNotFound {
    return Intl.message(
      'User is not found!',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Consultant is not found!`
  String get consultantNotFound {
    return Intl.message(
      'Consultant is not found!',
      name: 'consultantNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Consultant is not available!`
  String get consultantNotAvailable {
    return Intl.message(
      'Consultant is not available!',
      name: 'consultantNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Sorry,you have another appointment in same time`
  String get youHaveAnotherAppointmentError {
    return Intl.message(
      'Sorry,you have another appointment in same time',
      name: 'youHaveAnotherAppointmentError',
      desc: '',
      args: [],
    );
  }

  /// `Sorry,you don't have enough cash`
  String get youHaveNoEnoughCashError {
    return Intl.message(
      'Sorry,you don\'t have enough cash',
      name: 'youHaveNoEnoughCashError',
      desc: '',
      args: [],
    );
  }

  /// `Appointment booked successfully`
  String get appointmentCreatedSuccessfully {
    return Intl.message(
      'Appointment booked successfully',
      name: 'appointmentCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Time must not be empty`
  String get timeRequired {
    return Intl.message(
      'Time must not be empty',
      name: 'timeRequired',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Money must not be empty`
  String get requiredMoney {
    return Intl.message(
      'Money must not be empty',
      name: 'requiredMoney',
      desc: '',
      args: [],
    );
  }

  /// `send rating`
  String get sendRating {
    return Intl.message(
      'send rating',
      name: 'sendRating',
      desc: '',
      args: [],
    );
  }

  /// `Search must not be empty`
  String get searchRequired {
    return Intl.message(
      'Search must not be empty',
      name: 'searchRequired',
      desc: '',
      args: [],
    );
  }

  /// `Search Page`
  String get searchPage {
    return Intl.message(
      'Search Page',
      name: 'searchPage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
