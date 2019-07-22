import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_door_buzzer/src/presentation/localizations/buzzer_localization_de.dart';
import 'package:flutter_door_buzzer/src/presentation/localizations/buzzer_localization_en.dart';
import 'package:flutter_door_buzzer/src/presentation/localizations/buzzer_localization_fr.dart';
import 'package:intl/intl.dart';

abstract class BuzzerLocalizations {
  static BuzzerLocalizations of(BuildContext context) {
    return Localizations.of<BuzzerLocalizations>(context, BuzzerLocalizations);
  }

  /// --------------------------------------------------------------------------
  ///                                   App
  /// --------------------------------------------------------------------------

  String get appName;

  /// --------------------------------------------------------------------------
  ///                               Home Page
  /// --------------------------------------------------------------------------

  String get homeTitle;

  String get homeCTA;

  String get homeWelcome;

  /// --------------------------------------------------------------------------
  ///                 Authentication Page - Login - SignUp
  /// --------------------------------------------------------------------------

  String get authTitle;

  String get authBubbleLoginCTA;

  String get authBubbleRegisterCTA;

  String get authForgotPasswordCTA;

  String get authRegisterFailed;

  String get authRegisterTitle;

  String get authRegisterCTA;

  String get authPrivacyExplain;

  String get authPrivacyReadCTA;

  String get authLoginTitle;

  String get authLoginCTA;

  String get authLoginSucceed;

  String get authLogoutLabel;

  String get authLogoutCTA;

  /// --------------------------------------------------------------------------
  ///                                Forms
  /// --------------------------------------------------------------------------

  String get formEmailLabel;

  String get formEmailHint;

  String get formNoEmailExplain;

  String get formNotEmailExplain;

  String get formPasswordLabel;

  String get formNoPasswordExplain;

  String get formPassword2Label;

  /// --------------------------------------------------------------------------
  ///                              Account
  /// --------------------------------------------------------------------------

  String get accountActiveStatusLabel;

  /// --------------------------------------------------------------------------
  ///                              Buzzer Page
  /// --------------------------------------------------------------------------

  String get buzzerTitle;

  String get buzzerDoorCTA;

  String get buzzerDoorFailed;

  String get buzzerDoorSucceed;

  /// --------------------------------------------------------------------------
  ///                             Settings Page
  /// --------------------------------------------------------------------------

  String get settingsTitle;

  String get settingsCTA;

  String get settingsToggleDarkModeCTA;

  /// --------------------------------------------------------------------------
  ///                             Menu Widget
  /// --------------------------------------------------------------------------

  String get menuPPCTA;

  String get menuToSCTA;

  /// --------------------------------------------------------------------------
  ///                              Commons
  /// --------------------------------------------------------------------------

  String get account;

  String get middleDot;

  String get username;

  String get token;

  String get cancel;

  String get history;

  String get loadMore;

  String get retry;

  String get yes;

  String get no;

  String get more;

  String get errorOccurred;

  String get notYetImplemented;

  String get notSupported;

  /// --------------------------------------------------------------------------
  ///                            Exception Error
  /// --------------------------------------------------------------------------

  String get exceptionFormatException;

  String get exceptionTimeoutException;

  /// --------------------------------------------------------------------------
  ///                            Api Error
  /// --------------------------------------------------------------------------

  String get apiErrorWrongPasswordError;

  String get apiErrorUserNotFoundError;

  /// --------------------------------------------------------------------------
  ///                       HTTP Request Error (4XX)
  /// --------------------------------------------------------------------------

  String get httpClientErrorBadRequest;

  String get httpClientErrorPaymentRequired;

  String get httpClientErrorForbidden;

  String get httpClientErrorNotFound;

  String get httpClientErrorMethodNotAllowed;

  String get httpClientErrorNotAcceptable;

  String get httpClientErrorRequestTimeout;

  String get httpClientErrorConflict;

  String get httpClientErrorGone;

  String get httpClientErrorLengthRequired;

  String get httpClientErrorPayloadTooLarge;

  String get httpClientErrorURITooLong;

  String get httpClientErrorUnsupportedMediaType;

  String get httpClientErrorExpectationFailed;

  String get httpClientErrorUpgradeRequired;

  /// --------------------------------------------------------------------------
  ///                       HTTP Server Error (5XX)
  /// --------------------------------------------------------------------------

  String get httpServerErrorInternalServerError;

  String get httpServerErrorNotImplemented;

  String get httpServerErrorBadGateway;

  String get httpServerErrorServiceUnavailable;

  String get httpServerErrorGatewayTimeout;

  String get httpServerErrorHttpVersionNotSupported;
}

class BuzzerLocalizationsDelegate
    extends LocalizationsDelegate<BuzzerLocalizations> {
  const BuzzerLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'de', 'fr'].contains(locale.languageCode);

  @override
  Future<BuzzerLocalizations> load(Locale locale) {
    final String name =
        (locale.countryCode == null || locale.countryCode.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;

    if (locale.languageCode == 'de') {
      return BuzzerLocalizationsDE.load(locale);
    } else if (locale.languageCode == 'fr') {
      return BuzzerLocalizationsFR.load(locale);
    } else {
      return BuzzerLocalizationsEN.load(locale);
    }
  }

  @override
  bool shouldReload(BuzzerLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultBuzzerLocalizations.delegate(en_US)';
}
