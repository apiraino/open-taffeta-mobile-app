import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class BuzzerLocalizationsDE implements BuzzerLocalizations {
  const BuzzerLocalizationsDE();

  /// --------------------------------------------------------------------------
  ///                                   App
  /// --------------------------------------------------------------------------

  @override
  String get appName => 'Door Buzzer';

  /// --------------------------------------------------------------------------
  ///                               Home Page
  /// --------------------------------------------------------------------------

  @override
  String get homeTitle => 'Door Buzzer';

  @override
  String get homeCTA => 'Home';

  @override
  String get homeWelcome => 'Welcome on our $appName app!';

  /// --------------------------------------------------------------------------
  ///                 Authentication Page - Register - Login
  /// --------------------------------------------------------------------------

  @override
  String get authTitle => 'Connection';

  @override
  String get authBubbleLoginCTA => 'login';

  @override
  String get authBubbleRegisterCTA => 'registrieren';

  @override
  String get authRegisterTitle => 'Neues Benutzerkonto';

  @override
  String get authRegisterCTA => 'Registrieren';

  @override
  String get authRegisterFailed => 'Registrierung fehlgeschlagen';

  @override
  String get authLoginTitle => 'Login';

  @override
  String get authLoginCTA => 'Login';

  @override
  String get authForgotPasswordCTA => 'Passwort vergessen?';

  @override
  String get authLoginSucceed => 'eingelogged';

  @override
  String get authPrivacyExplain =>
      'Like privacy? We feel you. We don’t use or sell your data.';

  @override
  String get authPrivacyReadCTA => 'Touch to read our privacy policy.';

  @override
  String get authLogoutLabel => 'Logout';

  @override
  String get authLogoutCTA => 'Logout';

  /// --------------------------------------------------------------------------
  ///                                Forms
  /// --------------------------------------------------------------------------

  @override
  String get formEmailLabel => 'Leere Email';

  @override
  String get formEmailHint => 'someone@email.com';

  @override
  String get formNotEmailExplain => 'Bitte gib eine gültige Emailadresse an.';

  @override
  String get formNoEmailExplain => 'Bitte Emailadresse eingeben.';

  @override
  String get formPasswordLabel => 'Leeres Passwort';

  @override
  String get formNoPasswordExplain => 'Bitte gib ein Passwort an.';

  @override
  String get formPassword2Label => 'Passwort';

  /// --------------------------------------------------------------------------
  ///                              Account Page
  /// --------------------------------------------------------------------------

  @override
  String get accountActiveStatusLabel => 'Aktiv';

  /// --------------------------------------------------------------------------
  ///                              Buzzer Page
  /// --------------------------------------------------------------------------

  @override
  String get buzzerTitle => 'Buzzer';

  @override
  String get buzzerDoorCTA => 'Buzz door';

  @override
  String get buzzerDoorFailed => 'Türöffner fehlgeschlagen!';

  @override
  String get buzzerDoorSucceed => 'Türöffner aktiviert!';

  /// --------------------------------------------------------------------------
  ///                             Settings Page
  /// --------------------------------------------------------------------------

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsToggleDarkModeCTA => 'Dunkle Ansicht';

  /// --------------------------------------------------------------------------
  ///                             Menu Widget
  /// --------------------------------------------------------------------------

  @override
  String get menuPPCTA => 'Privacy Policy';

  @override
  String get menuToSCTA => 'Terms of Service';

  /// --------------------------------------------------------------------------
  ///                              Commons
  /// --------------------------------------------------------------------------

  @override
  String get middleDot => '·';

  @override
  String get username => 'Benutzername';

  @override
  String get token => 'Token';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get settingsCTA => 'Einstellungen';

  @override
  String get account => 'Konto';

  @override
  String get history => 'History';

  @override
  String get loadMore => 'mehr laden';

  @override
  String get retry => 'erneut veruschen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get more => 'Mehr';

  @override
  String get errorOccurred => 'Ein Fehler ist aufgetreten';

  @override
  String get notYetImplemented => 'Noch nicht impelmentiert';

  @override
  String get notSupported => 'Nicht unterstützt';

  /// --------------------------------------------------------------------------
  ///                            Exception Error
  /// --------------------------------------------------------------------------

  @override
  String get exceptionFormatException => 'Exception : Wrong Format';

  @override
  String get exceptionTimeoutException => 'Exception : Request Timeout';

  /// --------------------------------------------------------------------------
  ///                            Api Error
  /// --------------------------------------------------------------------------

  @override
  String get apiErrorWrongPasswordError => 'Ungültiges Passwort';

  @override
  String get apiErrorUserNotFoundError => 'Benutzer nicht gefunden';

  /// --------------------------------------------------------------------------
  ///                       HTTP Client Error (4XX)
  /// --------------------------------------------------------------------------

  @override
  String get httpClientErrorBadRequest => 'Bad request';

  @override
  String get httpClientErrorPaymentRequired => 'Payment required';

  @override
  String get httpClientErrorForbidden => 'Forbidden';

  @override
  String get httpClientErrorNotFound => 'Not found';

  @override
  String get httpClientErrorMethodNotAllowed => 'Not allowed';

  @override
  String get httpClientErrorNotAcceptable => 'Not acceptable';

  @override
  String get httpClientErrorRequestTimeout => 'Request timeout';

  @override
  String get httpClientErrorConflict => 'Conflict';

  @override
  String get httpClientErrorGone => 'Gone';

  @override
  String get httpClientErrorLengthRequired => 'Length required';

  @override
  String get httpClientErrorPayloadTooLarge => 'Payload too large';

  @override
  String get httpClientErrorURITooLong => 'URI too long';

  @override
  String get httpClientErrorUnsupportedMediaType => 'Unsupported media type';

  @override
  String get httpClientErrorExpectationFailed => 'Expectation Failed';

  @override
  String get httpClientErrorUpgradeRequired => 'Upgrade required';

  /// --------------------------------------------------------------------------
  ///                       HTTP Server Error (5XX)
  /// --------------------------------------------------------------------------

  @override
  String get httpServerErrorInternalServerError => 'Internal Server Error';

  @override
  String get httpServerErrorNotImplemented => 'Not implemented';

  @override
  String get httpServerErrorBadGateway => 'Bad Gateway';

  @override
  String get httpServerErrorServiceUnavailable => 'Service Unavailable';

  @override
  String get httpServerErrorGatewayTimeout => 'Gateway Timeout';

  @override
  String get httpServerErrorHttpVersionNotSupported =>
      'HTTP Version Not Supported';

  /// Creates an object that provides US English resource values for the
  /// application.
  ///
  /// The [locale] parameter is ignored.
  ///
  /// This method is typically used to create a [LocalizationsDelegate].
  /// The [MaterialApp] does so by default.
  static Future<BuzzerLocalizations> load(Locale locale) {
    return SynchronousFuture<BuzzerLocalizations>(
        const BuzzerLocalizationsDE());
  }

  /// A [LocalizationsDelegate] that uses [BuzzerLocalizationsFR._load]
  /// to create an instance of this class.
  ///
  /// [MaterialApp] automatically adds this value to [MaterialApp.localizationsDelegates].
  static const LocalizationsDelegate<BuzzerLocalizations> delegate =
      BuzzerLocalizationsDelegate();
}
