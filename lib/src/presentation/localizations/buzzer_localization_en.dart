import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class BuzzerLocalizationsEN implements BuzzerLocalizations {
  const BuzzerLocalizationsEN();

  /// --------------------------------------------------------------------------
  ///                                   App
  /// --------------------------------------------------------------------------

  @override
  String get appName => 'Buzzer Door';

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
  ///                 Authentication Page - Login - SignUp
  /// --------------------------------------------------------------------------

  @override
  String get authTitle => 'Connection';

  @override
  String get authBubbleLoginCTA => 'login';

  @override
  String get authBubbleRegisterCTA => 'register';

  @override
  String get authRegisterTitle => 'Create an new account';

  @override
  String get authRegisterCTA => 'Register';

  @override
  String get authRegisterFailed => 'Registration failed!';

  @override
  String get authLoginTitle => 'Login';

  @override
  String get authLoginCTA => 'Login';

  @override
  String get authLoginSucceed => 'Login succeed';

  @override
  String get authForgotPasswordCTA => 'Forgot password?';

  @override
  String get authLogoutLabel => 'Logout';

  @override
  String get authLogoutCTA => 'Logout';

  @override
  String get authPrivacyExplain =>
      'Like privacy? We feel you. We don’t use or sell your data.';

  @override
  String get authPrivacyReadCTA => 'Touch to read our privacy policy.';

  /// --------------------------------------------------------------------------
  ///                                Forms
  /// --------------------------------------------------------------------------

  @override
  String get formEmailLabel => 'Email';

  @override
  String get formEmailHint => 'someone@email.com';

  @override
  String get formNotEmailExplain => 'Please enter a real e-mail.';

  @override
  String get formNoEmailExplain => 'Please provide an email';

  @override
  String get formPasswordLabel => 'Password';

  @override
  String get formNoPasswordExplain => 'Please provide a password';

  @override
  String get formPassword2Label => 'Repeat password';

  /// --------------------------------------------------------------------------
  ///                              Account Page
  /// --------------------------------------------------------------------------

  @override
  String get accountActiveStatusLabel => 'Active';

  /// --------------------------------------------------------------------------
  ///                              Buzzer Page
  /// --------------------------------------------------------------------------

  @override
  String get buzzerTitle => 'Buzzer';

  @override
  String get buzzerDoorCTA => 'Buzz door';

  @override
  String get buzzerDoorFailed => 'Door opening failed!';

  @override
  String get buzzerDoorSucceed => 'Door opening succeed!';

  /// --------------------------------------------------------------------------
  ///                             Settings Page
  /// --------------------------------------------------------------------------

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsToggleDarkModeCTA => 'Dark Mode';

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
  String get username => 'Username';

  @override
  String get token => 'Token';

  @override
  String get cancel => 'Cancel';

  @override
  String get settingsCTA => 'Settings';

  @override
  String get account => 'Account';

  @override
  String get history => 'History';

  @override
  String get loadMore => 'Load more';

  @override
  String get retry => 'Retry';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get more => 'More';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get notYetImplemented => 'Not yet implemented';

  @override
  String get notSupported => 'Not supported';

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
  String get apiErrorWrongPasswordError => 'Wrong password';

  @override
  String get apiErrorUserNotFoundError => 'User not found';

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
        const BuzzerLocalizationsEN());
  }

  /// A [LocalizationsDelegate] that uses [BuzzerLocalizationsEN.load]
  /// to create an instance of this class.
  ///
  /// [MaterialApp] automatically adds this value to [MaterialApp.localizationsDelegates].
  static const LocalizationsDelegate<BuzzerLocalizations> delegate =
      BuzzerLocalizationsDelegate();
}
