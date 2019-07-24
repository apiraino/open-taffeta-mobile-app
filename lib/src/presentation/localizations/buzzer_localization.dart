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
  ///                              Commons
  /// --------------------------------------------------------------------------

  String get account;

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
  ///                             Menu Widget
  /// --------------------------------------------------------------------------

  String get menuPPCTA;

  String get menuToSCTA;

  /// --------------------------------------------------------------------------
  ///                 Authentication Page - Login - SignUp
  /// --------------------------------------------------------------------------

  String get authTitle;

  String get authBubbleLoginCTA;

  String get authBubbleRegisterCTA;

  String get authForgotPasswordCTA;

  String get authRegisterSucceed;

  String get authRegisterFailed;

  String get authRegisterTitle;

  String get authRegisterCTA;

  String get authLoginTitle;

  String get authLoginCTA;

  String get authLoginSucceed;

  String get authLoginFailed;

  String get authLogoutLabel;

  String get authLogoutCTA;

  String get authPrivacyExplain;

  String get authPrivacyReadCTA;

  String get authAccountAlreadyExistsFailure;

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

  String get formPasswordWrongPolicy;

  /// --------------------------------------------------------------------------
  ///                              Account
  /// --------------------------------------------------------------------------

  String get accountActiveStatusLabel;

  /// --------------------------------------------------------------------------
  ///                             Settings Page
  /// --------------------------------------------------------------------------

  String get settingsTitle;

  String get settingsCTA;

  String get settingsToggleDarkModeCTA;

  /// --------------------------------------------------------------------------
  ///                              Door Page
  /// --------------------------------------------------------------------------

  String get doorPageTitle;

  String get doorOpeningCTA;

  String get doorOpeningFailed;

  String get doorOpeningSucceed;

  /// --------------------------------------------------------------------------
  ///                            Exceptions and Errors
  /// --------------------------------------------------------------------------

  String get exceptionFormatException;

  String get exceptionTimeoutException;

  /// --------------------------------------------------------------------------
  ///                            App Exceptions
  /// --------------------------------------------------------------------------

  String get appErrorAuthUnauthorized;

  String get appErrorAuthAccountDisabled;

  String get appErrorAuthForbidden;

  String get appErrorAuthNoToken;

  String get appErrorUserNotFound;

  String get doorNotFound;

  String get appErrorServerSideProblem;

  /// --------------------------------------------------------------------------
  ///                             Errors
  /// --------------------------------------------------------------------------

  String get errorNotYetImplemented;

  String get errorNotSupported;

  /// --------------------------------------------------------------------------
  ///                       HTTP Request Error (4XX)
  /// --------------------------------------------------------------------------

  String get http400ClientErrorBadRequest;

  String get http401ClientErrorUnauthorized;

  String get http402ClientErrorPaymentRequired;

  String get http403ClientErrorForbidden;

  String get http404ClientErrorNotFound;

  String get http405ClientErrorMethodNotAllowed;

  String get http406ClientErrorNotAcceptable;

  String get http408ClientErrorRequestTimeout;

  String get http409ClientErrorConflict;

  String get http410ClientErrorGone;

  String get http411ClientErrorLengthRequired;

  String get http413ClientErrorPayloadTooLarge;

  String get http414ClientErrorURITooLong;

  String get http415ClientErrorUnsupportedMediaType;

  String get http417ClientErrorExpectationFailed;

  String get http426ClientErrorUpgradeRequired;

  /// --------------------------------------------------------------------------
  ///                       HTTP Server Error (5XX)
  /// --------------------------------------------------------------------------

  String get http500ServerErrorInternalServerError;

  String get http501ServerErrorNotImplemented;

  String get http502ServerErrorBadGateway;

  String get http503ServerErrorServiceUnavailable;

  String get http504ServerErrorGatewayTimeout;

  String get http505ServerErrorHttpVersionNotSupported;
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
