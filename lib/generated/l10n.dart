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
