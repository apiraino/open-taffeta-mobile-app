import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';

class BuzzerLocalizationsDE implements BuzzerLocalizations {
  const BuzzerLocalizationsDE();

  /// App
  @override
  String get appName => 'Door Buzzer';

  /// Login Page
  @override
  String get authTitle => 'Connection';

  @override
  String get authNoEmailTitle => 'Empty email';

  @override
  String get authNotEmailExplain => 'Please enter a real e-mail.';

  @override
  String get authNoEmailExplain => 'Please provide an email';

  @override
  String get authNoPasswordTitle => 'Empty password';

  @override
  String get authNoPasswordExplain => 'Please provide a password';

  @override
  String get authCreateYourAccount => 'Create your account';

  @override
  String get authRegisterCTA => 'Sign-up';

  @override
  String get authPrivacyExplain =>
      'Like privacy? We feel you. We don’t use or sell your data.';

  @override
  String get authPrivacyReadCTA => 'Touch to read our privacy policy.';

  @override
  String get authLoginGoogleCTA => 'Sign-in with Google';

  @override
  String get authLoginFacebookCTA => 'Sign-in with Facebook';

  @override
  String get authAlreadyHaveAccountCTA => 'Already have an account? Sign-in';

  @override
  String get authLogin => 'Sign-in with your account';

  @override
  String get authLoginCTA => 'Sign-in';

  @override
  String get authForgotPasswordCTA => 'Forgot password?';

  @override
  String get authNoAccountCTA => 'Don\'t have an account yet? Sign-up';

  @override
  String get authOr => 'OR';

  /// Home Page

  @override
  String get homeTitle => 'Door Buzzer';

  @override
  String get homeCTA => 'Home';

  @override
  String get homeWelcome => 'Welcome on our $appName app!';

  /// Account Page

  @override
  String get accountTitle => 'Account';

  @override
  String get accountCTA => 'Account';

  /// Buzzer Page

  @override
  String get buzzerTitle => 'Buzzer';

  @override
  String get buzzerDoorCTA => 'Buzz door';

  @override
  String get buzzerDoorFailed => 'Door opening failed!';

  @override
  String get buzzerDoorSucceed => 'Door opening succeed!';

  /// Settings Page

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsThemeCTA => 'Dark Mode';

  @override
  String get settingsThemeDefault => 'Default';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  /// Search Page

  @override
  String get searchTitle => 'Search';

  @override
  String get searchSearchBarHint => 'Search resume...';

  /// Menu Widget

  @override
  String get menuPPCTA => 'Privacy Policy';

  @override
  String get menuToSCTA => 'Terms of Service';

  /// Exception Error
  @override
  String get exceptionFormatException => 'Exception : Wrong Format';

  @override
  String get exceptionTimeoutException => 'Exception : Request Timeout';

  /// Api Error
  @override
  String get apiErrorWrongPasswordError => 'Wrong password';

  @override
  String get apiErrorUserNotFoundError => 'User not found';

  /// Server Error : HTTP 400
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

  /// Server Error : HTTP 500
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

  /// Others
  @override
  String get middleDot => '·';

  @override
  String get username => 'Username';

  @override
  String get email => 'Email';

  @override
  String get password => 'Passwort';

  @override
  String get token => 'Token';

  @override
  String get cancel => 'Cancel';

  @override
  String get settingsCTA => 'Settings';

  @override
  String get account => 'Account';

  @override
  String get login => 'Login';

  @override
  String get loginCTA => 'Login';

  @override
  String get loginSucceed => 'Logged';

  @override
  String get signupFailed => 'Signup failed!';

  @override
  String get logout => 'Logout';

  @override
  String get logoutCTA => 'Logout';

  @override
  String get home => 'Home';

  @override
  String get resume => 'Resume';

  @override
  String get profile => 'Profile';

  @override
  String get search => 'Search';

  @override
  String get history => 'History';

  @override
  String get loadMore => 'Load more';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get retry => 'Retry';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get more => 'More';

  @override
  String get notYetImplemented => 'Not yet implemented';

  @override
  String get notSupported => 'Not supported';

  @override
  String get forgotPasswordTitle => 'Retrieve password';

  @override
  String get forgotPasswordExplain =>
      'Enter your login email and we\'ll send you instructions to reset your password';

  @override
  String get forgotPasswordResetCTA => 'Reset password';

  @override
  String get forgotPasswordNoEmailTitle => 'Empty email';

  @override
  String get forgotPasswordNoEmailExplain => 'Please provide an email';

  @override
  String get forgotPasswordSuccessMessage =>
      'Email with instructions has been send.';

  @override
  String get forgotPasswordErrorMessage =>
      'An error occurred while sending the email with instructions';

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
