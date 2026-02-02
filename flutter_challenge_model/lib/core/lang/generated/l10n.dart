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

class Applang {
  Applang();

  static Applang? _current;

  static Applang get current {
    assert(
      _current != null,
      'No instance of Applang was loaded. Try to initialize the Applang delegate before accessing Applang.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Applang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Applang();
      Applang._current = instance;

      return instance;
    });
  }

  static Applang of(BuildContext context) {
    final instance = Applang.maybeOf(context);
    assert(
      instance != null,
      'No instance of Applang present in the widget tree. Did you add Applang.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Applang? maybeOf(BuildContext context) {
    return Localizations.of<Applang>(context, Applang);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Applang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Applang> load(Locale locale) => Applang.load(locale);
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
