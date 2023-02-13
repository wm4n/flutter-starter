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

  /// `Popular Photos`
  String get appTitle {
    return Intl.message(
      'Popular Photos',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Created by {name}`
  String createdByWho(Object name) {
    return Intl.message(
      'Created by $name',
      name: 'createdByWho',
      desc: '',
      args: [name],
    );
  }

  /// `{name}'s Photo`
  String authorPhotoTitle(Object name) {
    return Intl.message(
      '$name\'s Photo',
      name: 'authorPhotoTitle',
      desc: '',
      args: [name],
    );
  }

  /// `Created at {time}`
  String createdAtTime(Object time) {
    return Intl.message(
      'Created at $time',
      name: 'createdAtTime',
      desc: '',
      args: [time],
    );
  }

  /// `Not available`
  String get infoNotAvailable {
    return Intl.message(
      'Not available',
      name: 'infoNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Created at {time} by {name}`
  String createdAtTimeByWho(Object time, Object name) {
    return Intl.message(
      'Created at $time by $name',
      name: 'createdAtTimeByWho',
      desc: '',
      args: [time, name],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
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
