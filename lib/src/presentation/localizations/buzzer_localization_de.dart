import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class BuzzerLocalizationsDE implements BuzzerLocalizations {
  const BuzzerLocalizationsDE();

  /// --------------------------------------------------------------------------
  ///                              Commons
  /// --------------------------------------------------------------------------


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
  ///                             Menu Widget
  /// --------------------------------------------------------------------------

  @override
  String get menuPPCTA => 'Datenschutzerklärung';

  @override
  String get menuToSCTA => 'Terms of Service';

  /// --------------------------------------------------------------------------
  ///                 Authentication Page - Register - Login
  /// --------------------------------------------------------------------------

  @override
  String get authTitle => 'Connection';

  @override
  String get authBubbleLoginCTA => 'Einloggen';

  @override
  String get authBubbleRegisterCTA => 'Registrieren';

  @override
  String get authRegisterTitle => 'Neues Benutzerkonto';

  @override
  String get authRegisterCTA => 'Registrieren';

  @override
  String get authRegisterSucceed => 'Registration succeed!';

  @override
  String get authRegisterFailed => 'Registrierung fehlgeschlagen';

  @override
  String get authLoginTitle => 'Login';

  @override
  String get authLoginCTA => 'Login';

  @override
  String get authLoginSucceed => 'Eingelogged';

  @override
  String get authLoginFailed => 'Login fehlgeschlagen';

  @override
  String get authForgotPasswordCTA => 'Passwort vergessen?';

  @override
  String get authPrivacyExplain =>
      'Like privacy? We feel you. We don’t use or sell your data.';

  @override
  String get authPrivacyReadCTA => 'Touch to read our privacy policy.';

  @override
  String get authLogoutLabel => 'Abmeldung';

  @override
  String get authLogoutCTA => 'Abmeldung';

  @override
  String get authAccountAlreadyExistsFailure =>
      'Ein Konto mit diesem Benutzernamen oder dieser E-Mail existiert bereits.';

  /// --------------------------------------------------------------------------
  ///                                Forms
  /// --------------------------------------------------------------------------

  @override
  String get formEmailLabel => 'Email';

  @override
  String get formEmailHint => 'someone@email.com';

  @override
  String get formNotEmailExplain => 'Bitte gib eine gültige Emailadresse an.';

  @override
  String get formNoEmailExplain => 'Bitte Emailadresse eingeben.';

  @override
  String get formPasswordLabel => 'Passwort';

  @override
  String get formNoPasswordExplain => 'Bitte gib ein Passwort an.';

  @override
  String get formPassword2Label => 'Passwort';

  @override
  String get formPasswordWrongPolicy =>
      'Das Passwort passt nicht zu unserer Passwort Richtlinie.';

  /// --------------------------------------------------------------------------
  ///                              Account Page
  /// --------------------------------------------------------------------------

  @override
  String get accountActiveStatusLabel => 'Aktiv';

  /// --------------------------------------------------------------------------
  ///                             Settings Page
  /// --------------------------------------------------------------------------

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsToggleDarkModeCTA => 'Dunkle Ansicht';

  /// --------------------------------------------------------------------------
  ///                              Door Page
  /// --------------------------------------------------------------------------

  @override
  String get doorPageTitle => 'Buzzer';

  @override
  String get doorOpeningCTA => 'Buzz door';

  @override
  String get doorOpeningFailed => 'Türöffner fehlgeschlagen!';

  @override
  String get doorOpeningSucceed => 'Türöffner aktiviert!';

  @override
  String get doorNotFound => 'Tür nicht gefunden.';

  /// --------------------------------------------------------------------------
  ///                            App Exceptions
  /// --------------------------------------------------------------------------

  @override
  String get appErrorUserNotFound => 'Benutzer nicht gefunden';

  @override
  String get appErrorAuthForbidden => 'Access forbidden';

  @override
  String get appErrorAuthNoToken => 'No token emitted';

  @override
  String get appErrorAuthUnauthorized => 'Not authorized';

  @override
  String get appErrorAuthAccountDisabled => 'Account disabled';

  @override
  String get appErrorServerSideProblem => 'A server side error occured';

  /// --------------------------------------------------------------------------
  ///                            App Errors
  /// --------------------------------------------------------------------------

  @override
  String get errorNotYetImplemented => 'Noch nicht impelmentiert';

  @override
  String get errorNotSupported => 'Nicht unterstützt';

  /// --------------------------------------------------------------------------
  ///                            Other Exceptions
  /// --------------------------------------------------------------------------

  @override
  String get exceptionFormatException => 'Exception : Wrong Format';

  @override
  String get exceptionTimeoutException => 'Exception : Request Timeout';

  /// --------------------------------------------------------------------------
  ///                       HTTP Client Error (4XX)
  /// --------------------------------------------------------------------------

  @override
  String get http400ClientErrorBadRequest => 'Bad request';

  @override
  String get http401ClientErrorUnauthorized => 'Unauthorized';

  @override
  String get http402ClientErrorPaymentRequired => 'Payment required';

  @override
  String get http403ClientErrorForbidden => 'Forbidden';

  @override
  String get http404ClientErrorNotFound => 'Not found';

  @override
  String get http405ClientErrorMethodNotAllowed => 'Not allowed';

  @override
  String get http406ClientErrorNotAcceptable => 'Not acceptable';

  @override
  String get http408ClientErrorRequestTimeout => 'Request timeout';

  @override
  String get http409ClientErrorConflict => 'Conflict';

  @override
  String get http410ClientErrorGone => 'Gone';

  @override
  String get http411ClientErrorLengthRequired => 'Length required';

  @override
  String get http413ClientErrorPayloadTooLarge => 'Payload too large';

  @override
  String get http414ClientErrorURITooLong => 'URI too long';

  @override
  String get http415ClientErrorUnsupportedMediaType => 'Unsupported media type';

  @override
  String get http417ClientErrorExpectationFailed => 'Expectation Failed';

  @override
  String get http426ClientErrorUpgradeRequired => 'Upgrade required';

  /// --------------------------------------------------------------------------
  ///                       HTTP Server Error (5XX)
  /// --------------------------------------------------------------------------

  @override
  String get http500ServerErrorInternalServerError => 'Internal Server Error';

  @override
  String get http501ServerErrorNotImplemented => 'Not implemented';

  @override
  String get http502ServerErrorBadGateway => 'Bad Gateway';

  @override
  String get http503ServerErrorServiceUnavailable => 'Service Unavailable';

  @override
  String get http504ServerErrorGatewayTimeout => 'Gateway Timeout';

  @override
  String get http505ServerErrorHttpVersionNotSupported =>
      'HTTP Version Not Supported';

  /// --------------------------------------------------------------------------
  ///                                 Misc
  /// --------------------------------------------------------------------------

  /// Creates an object that provides DE German resource values for the
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
