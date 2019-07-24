import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class BuzzerLocalizationsFR implements BuzzerLocalizations {
  const BuzzerLocalizationsFR();

  /// --------------------------------------------------------------------------
  ///                              Commons
  /// --------------------------------------------------------------------------

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

  /// --------------------------------------------------------------------------
  ///                                   App
  /// --------------------------------------------------------------------------

  @override
  String get appName => 'Door Buzzer';

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
  ///                             Menu Widget
  /// --------------------------------------------------------------------------

  @override
  String get menuPPCTA => 'Politique de confidentialité';

  @override
  String get menuToSCTA => 'Termes de Service';

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
  String get authRegisterSucceed => 'Registration succeed!';

  @override
  String get authRegisterFailed => 'Inscripiton échoué !';

  @override
  String get authLoginTitle => 'Connectez vous avec votre compte';

  @override
  String get authLoginCTA => 'Se connecter';

  @override
  String get authLoginSucceed => 'Logged';

  @override
  String get authLoginFailed => 'Login failed';

  @override
  String get authLogoutLabel => 'Se déconnecter';

  @override
  String get authLogoutCTA => 'Se déconnecter';

  @override
  String get authForgotPasswordCTA => 'Mot de passe oublié ?';

  @override
  String get authPrivacyExplain =>
      'Vous aimez votre vie privée ? Nous le savons. Nous n\'utilisons, ni vendons vos données.';

  @override
  String get authPrivacyReadCTA =>
      'Touchez ici pour lire notre politique de confidentialité.';

  @override
  String get authAccountAlreadyExistsFailure =>
      'Un compte avec le même nom d\'utilisateur ou e-mail existe déjà.';

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

  @override
  String get formPasswordWrongPolicy =>
      'Le mot de passe ne respecte pas notre politique de mot de passe.';

  /// --------------------------------------------------------------------------
  ///                              Account Page
  /// --------------------------------------------------------------------------

  @override
  String get accountActiveStatusLabel => 'Actif';

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
  ///                              Door Page
  /// --------------------------------------------------------------------------

  @override
  String get doorPageTitle => 'Buzzer';

  @override
  String get doorOpeningCTA => 'Buzz door';

  @override
  String get doorOpeningFailed => 'L\'ouverture de la porte à échoué !';

  @override
  String get doorOpeningSucceed => 'L\'ouverture de la porte à réussi !';

  @override
  String get doorNotFound => 'Tür nicht gefunden.';

  /// --------------------------------------------------------------------------
  ///                            App Exceptions
  /// --------------------------------------------------------------------------

  @override
  String get appErrorUserNotFound => 'Utilisateur introuvable.';

  @override
  String get appErrorAuthForbidden => 'Accès interdit.';

  @override
  String get appErrorAuthNoToken => 'Aucun token n\'a été émis.';

  @override
  String get appErrorAuthUnauthorized => 'Non autorisé.';

  @override
  String get appErrorAuthAccountDisabled => 'Compte utilisateur désactivé.';

  @override
  String get appErrorServerSideProblem =>
      'Un problème est survenu sur les serveurs.';

  /// --------------------------------------------------------------------------
  ///                            App Errors
  /// --------------------------------------------------------------------------

  @override
  String get errorNotYetImplemented => 'Pas encore implémenté';

  @override
  String get errorNotSupported => 'Non supporté';

  /// --------------------------------------------------------------------------
  ///                            Others Exceptions
  /// --------------------------------------------------------------------------

  @override
  String get exceptionFormatException => 'Exception : Mauvais Format';

  @override
  String get exceptionTimeoutException => 'Exception : Requete Expiré';

  /// --------------------------------------------------------------------------
  ///                       HTTP Client Error (4XX)
  /// --------------------------------------------------------------------------

  @override
  String get http400ClientErrorBadRequest => 'Mauvaise requete';

  @override
  String get http401ClientErrorUnauthorized => 'Non authorisé';

  @override
  String get http402ClientErrorPaymentRequired => 'Paiement requis';

  @override
  String get http403ClientErrorForbidden => 'Interdit';

  @override
  String get http404ClientErrorNotFound => 'Introuvable';

  @override
  String get http405ClientErrorMethodNotAllowed => 'Non autorisé';

  @override
  String get http406ClientErrorNotAcceptable => 'Non acceptable';

  @override
  String get http408ClientErrorRequestTimeout => 'Requete expirée';

  @override
  String get http409ClientErrorConflict => 'Conflit';

  @override
  String get http410ClientErrorGone => 'Disparu';

  @override
  String get http411ClientErrorLengthRequired => 'Taille requise';

  @override
  String get http413ClientErrorPayloadTooLarge => 'Payload trop large';

  @override
  String get http414ClientErrorURITooLong => 'Lien trop long';

  @override
  String get http415ClientErrorUnsupportedMediaType =>
      'Type de média non supporté';

  @override
  String get http417ClientErrorExpectationFailed => 'Échoué';

  @override
  String get http426ClientErrorUpgradeRequired => 'Mise à jour requise';

  /// --------------------------------------------------------------------------
  ///                       HTTP Server Error (5XX)
  /// --------------------------------------------------------------------------

  @override
  String get http500ServerErrorInternalServerError => 'Erreur Serveur interne';

  @override
  String get http501ServerErrorNotImplemented => 'Non implementé';

  @override
  String get http502ServerErrorBadGateway => 'Mauvaise passerelle';

  @override
  String get http503ServerErrorServiceUnavailable => 'Service non disponible ';

  @override
  String get http504ServerErrorGatewayTimeout => 'Temps ecoulé';

  @override
  String get http505ServerErrorHttpVersionNotSupported =>
      'Version HTTP non supporté';

  /// --------------------------------------------------------------------------
  ///                                 Misc
  /// --------------------------------------------------------------------------

  /// Creates an object that provides FR French resource values for the
  /// application.
  ///
  /// The [locale] parameter is ignored.
  ///
  /// This method is typically used to create a [LocalizationsDelegate].
  /// The [MaterialApp] does so by default.
  static Future<BuzzerLocalizations> load(Locale locale) {
    return SynchronousFuture<BuzzerLocalizations>(
        const BuzzerLocalizationsFR());
  }

  /// A [LocalizationsDelegate] that uses [BuzzerLocalizationsFR.load]
  /// to create an instance of this class.
  ///
  /// [MaterialApp] automatically adds this value to [MaterialApp.localizationsDelegates].
  static const LocalizationsDelegate<BuzzerLocalizations> delegate =
      BuzzerLocalizationsDelegate();
}
