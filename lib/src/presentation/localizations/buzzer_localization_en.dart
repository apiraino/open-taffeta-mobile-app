import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class BuzzerLocalizationsEN implements BuzzerLocalizations {
  const BuzzerLocalizationsEN();

  /// --------------------------------------------------------------------------
  ///                              Commons
  /// --------------------------------------------------------------------------

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
  ///                             Menu Widget
  /// --------------------------------------------------------------------------

  @override
  String get menuPPCTA => 'Privacy Policy';

  @override
  String get menuToSCTA => 'Terms of Service';

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
  String get authRegisterSucceed => 'Registration succeed!';

  @override
  String get authRegisterFailed => 'Registration failed!';

  @override
  String get authLoginTitle => 'Login';

  @override
  String get authLoginCTA => 'Login';

  @override
  String get authLoginSucceed => 'Login succeed';

  @override
  String get authLoginFailed => 'Login failed';

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

  @override
  String get authAccountAlreadyExistsFailure =>
      'An account with this username or email already exists.';

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

  @override
  String get formPasswordWrongPolicy =>
      'The password do not fit to our password policy.';

  /// --------------------------------------------------------------------------
  ///                              Account Page
  /// --------------------------------------------------------------------------

  @override
  String get accountActiveStatusLabel => 'Active';

  /// --------------------------------------------------------------------------
  ///                             Settings Page
  /// --------------------------------------------------------------------------

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsToggleDarkModeCTA => 'Dark Mode';

  /// --------------------------------------------------------------------------
  ///                              Door Page
  /// --------------------------------------------------------------------------

  @override
  String get doorPageTitle => 'Buzzer';

  @override
  String get doorOpeningCTA => 'Buzz door';

  @override
  String get doorOpeningFailed => 'Door opening failed!';

  @override
  String get doorOpeningSucceed => 'Door opening succeed!';

  @override
  String get doorNotFound => 'Door not found.';

  /// --------------------------------------------------------------------------
  ///                            App Exceptions
  /// --------------------------------------------------------------------------

  @override
  String get appErrorUserNotFound => 'User not found';

  /// --------------------------------------------------------------------------
  ///                            App Errors
  /// --------------------------------------------------------------------------

  @override
  String get errorNotYetImplemented => 'Not yet implemented';

  @override
  String get errorNotSupported => 'Not supported';

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
