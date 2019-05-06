import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization_de.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization_en.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization_fr.dart';
import 'package:intl/intl.dart';

abstract class BuzzerLocalizations {
  static BuzzerLocalizations of(BuildContext context) {
    return Localizations.of<BuzzerLocalizations>(context, BuzzerLocalizations);
  }

  /// App

  String get appName;

  /// Auth Page

  String get authTitle;

  String get authNoEmailTitle;

  String get authNotEmailExplain;

  String get authNoEmailExplain;

  String get authNoPasswordTitle;

  String get authNoPasswordExplain;

  String get authCreateYourAccount;

  String get authRegisterCTA;

  String get authPrivacyExplain;

  String get authPrivacyReadCTA;

  String get authLoginGoogleCTA;

  String get authLoginFacebookCTA;

  String get authAlreadyHaveAccountCTA;

  String get authLogin;

  String get authLoginCTA;

  String get authForgotPasswordCTA;

  String get authNoAccountCTA;

  String get authOr;

  /// Home Page

  String get homeTitle;

  String get homeCTA;

  String get homeWelcome;

  /// Account Page

  String get accountTitle;

  String get accountCTA;

  /// Buzzer Page

  String get buzzerTitle;

  String get buzzerDoorCTA;

  String get buzzerDoorFailed;

  String get buzzerDoorSucceed;

  ///Settings Page

  String get settingsTitle;

  String get settingsCTA;

  String get settingsThemeCTA;

  String get settingsThemeDefault;

  String get settingsThemeLight;

  String get settingsThemeDark;

  /// Search Page

  String get searchTitle;

  String get searchSearchBarHint;

  /// Menu Widget

  String get menuPPCTA;

  String get menuToSCTA;

  /// Commons

  String get account;

  String get middleDot;

  String get username;

  String get email;

  String get password;

  String get token;

  String get cancel;

  String get login;

  String get loginCTA;

  String get loginSucceed;

  String get signupFailed;

  String get logout;

  String get logoutCTA;

  String get home;

  String get resume;

  String get profile;

  String get search;

  String get history;

  String get loadMore;

  String get errorOccurred;

  String get retry;

  String get yes;

  String get no;

  String get more;

  String get notYetImplemented;

  String get notSupported;

  String get forgotPasswordTitle;

  String get forgotPasswordExplain;

  String get forgotPasswordResetCTA;

  String get forgotPasswordNoEmailTitle;

  String get forgotPasswordNoEmailExplain;

  String get forgotPasswordSuccessMessage;

  String get forgotPasswordErrorMessage;

  /// Exception Error

  String get exceptionFormatException;

  String get exceptionTimeoutException;

  /// Api Error

  String get apiErrorWrongPasswordError;

  String get apiErrorUserNotFoundError;

  /// Server Error : HTTP 400

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

  /// Server Error : HTTP 500

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
