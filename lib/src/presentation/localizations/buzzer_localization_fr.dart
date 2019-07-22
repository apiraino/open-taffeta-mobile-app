import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class BuzzerLocalizationsFR implements BuzzerLocalizations {
  const BuzzerLocalizationsFR();

  /// --------------------------------------------------------------------------
  ///                                   App
  /// --------------------------------------------------------------------------

  @override
  String get appName => 'Door Buzzer';

  /// --------------------------------------------------------------------------
  ///                 Authentication Page - Login - SignUp
  /// --------------------------------------------------------------------------

  @override
  String get authTitle => 'Connexion';

  @override
  String get authBubbleLoginCTA => 'Existant';

  @override
  String get authBubbleRegisterCTA => 'New';

  @override
  String get authRegisterTitle => 'Create un nouveau compte';

  @override
  String get authRegisterCTA => 'S\'inscrire';

  @override
  String get authForgotPasswordCTA => 'Mot de passe oublié ?';

  @override
  String get authRegisterFailed => 'Inscripiton échoué !';

  @override
  String get authLoginTitle => 'Connectez vous avec votre compte';

  @override
  String get authLoginCTA => 'Se connecter';

  @override
  String get authLoginSucceed => 'Logged';

  @override
  String get authLogoutLabel => 'Se déconnecter';

  @override
  String get authLogoutCTA => 'Se déconnecter';

  @override
  String get authPrivacyExplain =>
      'Vous aimez votre vie privée ? Nous le savons. Nous n\'utilisons, ni vendons vos données.';

  @override
  String get authPrivacyReadCTA =>
      'Touchez ici pour lire notre politique de confidentialité.';

  /// --------------------------------------------------------------------------
  ///                                Forms
  /// --------------------------------------------------------------------------

  @override
  String get formEmailLabel => 'E-mail';

  @override
  String get formEmailHint => 'email@exemple.fr';

  @override
  String get formNoEmailExplain => 'Merci de renseigner un e-mail';

  @override
  String get formNotEmailExplain => 'Merci de renseigner un e-mail existant.';

  @override
  String get formPasswordLabel => 'Mot de passe vide';

  @override
  String get formNoPasswordExplain => 'Merci de renseigner un mot de passe';

  @override
  String get formPassword2Label => 'Mot de passe';

  /// --------------------------------------------------------------------------
  ///                               Home Page
  /// --------------------------------------------------------------------------

  @override
  String get homeTitle => 'Home';

  @override
  String get homeCTA => 'Home';

  @override
  String get homeWelcome => 'Bienvenue sur notre application $appName !';

  /// --------------------------------------------------------------------------
  ///                              Account Page
  /// --------------------------------------------------------------------------

  @override
  String get accountActiveStatusLabel => 'Actif';

  /// --------------------------------------------------------------------------
  ///                              Buzzer Page
  /// --------------------------------------------------------------------------

  @override
  String get buzzerTitle => 'Buzzer';

  @override
  String get buzzerDoorCTA => 'Buzz door';

  @override
  String get buzzerDoorFailed => 'L\'ouverture de la porte à échoué !';

  @override
  String get buzzerDoorSucceed => 'L\'ouverture de la porte à réussi !';

  /// --------------------------------------------------------------------------
  ///                             Settings Page
  /// --------------------------------------------------------------------------

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsCTA => 'Paramètres';

  @override
  String get settingsToggleDarkModeCTA => 'Mode Sombre';

  /// --------------------------------------------------------------------------
  ///                             Menu Widget
  /// --------------------------------------------------------------------------

  @override
  String get menuPPCTA => 'Politique de confidentialité';

  @override
  String get menuToSCTA => 'Termes de Service';

  /// --------------------------------------------------------------------------
  ///                            Exception Error
  /// --------------------------------------------------------------------------

  @override
  String get exceptionFormatException => 'Exception : Mauvais Format';

  @override
  String get exceptionTimeoutException => 'Exception : Requete Expiré';

  /// Api Error
  @override
  String get apiErrorWrongPasswordError => 'Mauvais mot de passe';

  @override
  String get apiErrorUserNotFoundError => 'Utilisateur introuvable';

  /// --------------------------------------------------------------------------
  ///                       HTTP Client Error (4XX)
  /// --------------------------------------------------------------------------

  @override
  String get httpClientErrorBadRequest => 'Mauvaise requete';

  @override
  String get httpClientErrorPaymentRequired => 'Paiement requis';

  @override
  String get httpClientErrorForbidden => 'Interdit';

  @override
  String get httpClientErrorNotFound => 'Introuvable';

  @override
  String get httpClientErrorMethodNotAllowed => 'Non autorisé';

  @override
  String get httpClientErrorNotAcceptable => 'Non acceptable';

  @override
  String get httpClientErrorRequestTimeout => 'Requete expirée';

  @override
  String get httpClientErrorConflict => 'Conflit';

  @override
  String get httpClientErrorGone => 'Disparu';

  @override
  String get httpClientErrorLengthRequired => 'Taille requise';

  @override
  String get httpClientErrorPayloadTooLarge => 'Payload trop large';

  @override
  String get httpClientErrorURITooLong => 'Lien trop long';

  @override
  String get httpClientErrorUnsupportedMediaType =>
      'Type de média non supporté';

  @override
  String get httpClientErrorExpectationFailed => 'Échoué';

  @override
  String get httpClientErrorUpgradeRequired => 'Mise à jour requise';

  /// --------------------------------------------------------------------------
  ///                       HTTP Server Error (5XX)
  /// --------------------------------------------------------------------------

  @override
  String get httpServerErrorInternalServerError => 'Erreur Serveur interne';

  @override
  String get httpServerErrorNotImplemented => 'Non implementé';

  @override
  String get httpServerErrorBadGateway => 'Mauvaise passerelle';

  @override
  String get httpServerErrorServiceUnavailable => 'Service non disponible ';

  @override
  String get httpServerErrorGatewayTimeout => 'Temps ecoulé';

  @override
  String get httpServerErrorHttpVersionNotSupported =>
      'Version HTTP non supporté';

  /// --------------------------------------------------------------------------
  ///                              Commons
  /// --------------------------------------------------------------------------

  @override
  String get middleDot => '·';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get token => 'Jeton';

  @override
  String get cancel => 'Annuler';

  @override
  String get account => 'Compte';

  @override
  String get history => 'Historique';

  @override
  String get loadMore => 'Charger plus';

  @override
  String get retry => 'Re-éssayer';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get more => 'Plus';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get notYetImplemented => 'Pas encore implémenté';

  @override
  String get notSupported => 'Non supporté';

  //// Creates an object that provides US English resource values for the
  //// application.
  ///
  //// The [locale] parameter is ignored.
  ///
  //// This method is typically used to create a [LocalizationsDelegate].
  //// The [MaterialApp] does so by default.
  static Future<BuzzerLocalizations> load(Locale locale) {
    return SynchronousFuture<BuzzerLocalizations>(
        const BuzzerLocalizationsFR());
  }

  //// A [LocalizationsDelegate] that uses [BuzzerLocalizationsFR.load]
  //// to create an instance of this class.
  ///
  //// [MaterialApp] automatically adds this value to [MaterialApp.localizationsDelegates].
  static const LocalizationsDelegate<BuzzerLocalizations> delegate =
      BuzzerLocalizationsDelegate();
}
