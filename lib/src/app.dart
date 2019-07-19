import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/account/account_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/application/application.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/configuration/configuration.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/login/login.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/register/register.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/app_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/auth_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/config_repository.dart';
import 'package:flutter_door_buzzer/src/routes.dart';
import 'package:flutter_door_buzzer/src/ui/commons/styles.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:flutter_door_buzzer/src/ui/pages/main_navigation_page.dart';
import 'package:flutter_door_buzzer/src/ui/pages/splash_page.dart';
import 'package:flutter_door_buzzer/src/ui/widgets/error_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

/// This App wrap all the configuration logic with [ConfigurationBloc]
class ConfigurationWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConfigurationWrapperState();
}

class _ConfigurationWrapperState extends State<ConfigurationWrapper> {
  final String _tag = '_ConfigurationWrapperAppState';

  /// Blocs
  ConfigurationBloc _configBloc;

  @override
  void initState() {
    super.initState();

    _configBloc = ConfigurationBloc();
    _configBloc.dispatch(ConfigApp());
  }

  @override
  void dispose() {
    _configBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('$_tag:build');

    return BlocProvider<ConfigurationBloc>.value(
      value: _configBloc,
      child: BlocBuilder<ConfigurationEvent, ConfigurationState>(
        bloc: _configBloc,
        builder: (BuildContext context, ConfigurationState state) {
          if (state is ConfigLoading) {
            return MaterialApp(
              initialRoute: '/',
              home: SplashPage(),
              color: AppStyles.primaryColor,
            );
          } else if (state is ConfigLoaded) {
            /// Injection of all Repositories
            return MultiProvider(
              providers: [
                Provider<BuzzerRepository>.value(
                  value: state.buzzerRepo,
                ),
                Provider<ConfigRepository>.value(
                  value: state.configRepo,
                ),
                Provider<AppPreferencesRepository>.value(
                  value: state.appPrefsRepo,
                ),
                Provider<AuthRepository>.value(
                  value: state.authRepo,
                ),
              ],
              child: _ConfiguredApp(state),
            );
          }
          return Container();
        },
      ),
    );
  }
}

/// This is the wrapper of the App with all configurations
///
/// It injects :
/// - blocs
class _ConfiguredApp extends StatefulWidget {
  final ConfigLoaded state;

  const _ConfiguredApp(this.state);

  @override
  State<StatefulWidget> createState() => _ConfiguredAppState();
}

class _ConfiguredAppState extends State<_ConfiguredApp> {
  final String _tag = '_ConfiguredAppState';

  ApplicationBloc _appBloc;
  AuthenticationBloc _authBloc;
  LoginBloc _loginBloc;
  RegisterBloc _registerBloc;
  AccountBloc _accountBloc;

  ConfigLoaded get _state => widget.state;

  @override
  void initState() {
    super.initState();

    _appBloc = ApplicationBloc(
      appPreferencesRepository: _state.appPrefsRepo,
    );

    _loginBloc = LoginBloc(
      buzzerRepository: _state.buzzerRepo,
    );

    _registerBloc = RegisterBloc(
      buzzerRepository: _state.buzzerRepo,
    );

    _authBloc = AuthenticationBloc(
      authPreferencesRepository: _state.authRepo,
      buzzerRepository: _state.buzzerRepo,
      registerBloc: _registerBloc,
      loginBloc: _loginBloc,
    );

    _accountBloc = AccountBloc(
      authRepo: _state.authRepo,
      buzzerRepo: _state.buzzerRepo,
      authBloc: _authBloc,
    );

    _authBloc.dispatch(AppStarted());
    _appBloc.dispatch(AppInitialization());
  }

  @override
  void dispose() {
    _appBloc?.dispose();
    _accountBloc?.dispose();
    _authBloc?.dispose();
    _loginBloc?.dispose();
    _registerBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Injection of all global Blocs
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<LoginBloc>.value(value: _loginBloc),
        BlocProvider<RegisterBloc>.value(value: _registerBloc),
        BlocProvider<AuthenticationBloc>.value(value: _authBloc),
        BlocProvider<AccountBloc>.value(value: _accountBloc),
        BlocProvider<ApplicationBloc>.value(value: _appBloc),
      ],
      child: BlocBuilder<ApplicationEvent, ApplicationState>(
        bloc: _appBloc,
        builder: (BuildContext context, ApplicationState state) {
          if (state is AppLoading) {
            return MaterialApp(
              home: SplashPage(),
              debugShowCheckedModeBanner: false,
            );
          } else if (state is AppInitialized) {
            return _App(
              darkMode: state.isDarkMode,
            );
          } else if (state is AppFailure) {
            return ErrorApp(error: state.error);
          }
          return Container();
        },
      ),
    );
  }
}

/// This is the final app with all UI preferences
class _App extends StatelessWidget {
  final String _tag = '$_App';

  final bool darkMode;

  _App({Key key, this.darkMode = false})
      : assert(darkMode != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$_tag:build');

    /// Routes
    final Routes routes = Routes();

    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          BuzzerLocalizations.of(context).appName,
      theme: _buildCVTheme(darkMode),
      home: MainNavigationPage(),

      /// Use Fluro routes
      onGenerateRoute: routes.router.generator,

      localizationsDelegates: [
        const BuzzerLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
        Locale('fr'),
      ],
      debugShowCheckedModeBanner: false,

      ///showSemanticsDebugger: true,
    );
  }

  ThemeData _buildCVTheme(bool darkMode) {
    ThemeData themeData;
    if (!darkMode) {
      themeData = ThemeData.light();
    } else {
      themeData = ThemeData.dark();
    }

    themeData = themeData.copyWith(
      primaryColor: AppStyles.primaryColor,
      primaryColorLight: AppStyles.primaryColorLight,
      primaryColorDark: AppStyles.primaryColorDark,
      accentColor: AppStyles.accentColor,
      inputDecorationTheme: InputDecorationTheme(
        hasFloatingPlaceholder: true,
        border: OutlineInputBorder(),
      ),
    );

    Color buttonColor;
    ButtonThemeData buttonTheme;
    IconThemeData iconThemeData;
    if (!darkMode) {
      buttonColor = AppStyles.colorWhite;
      buttonTheme = ButtonThemeData(buttonColor: themeData.primaryColorLight);
      iconThemeData = IconThemeData(color: Colors.black);
    } else {
      buttonColor = AppStyles.primaryColorDark;
      buttonTheme = ButtonThemeData(buttonColor: themeData.primaryColorDark);
      iconThemeData = IconThemeData(color: Colors.white);
    }

    return themeData.copyWith(
      buttonColor: buttonColor,
      buttonTheme: buttonTheme,
      textTheme: _buildCVTextTheme(themeData.textTheme),
      primaryTextTheme: _buildCVTextTheme(themeData.primaryTextTheme),
      accentTextTheme: _buildCVTextTheme(themeData.accentTextTheme),
      iconTheme: iconThemeData,
    );
  }

  TextTheme _buildCVTextTheme(TextTheme base) {
    return base.apply(
      fontFamily: 'Arial',
    );
  }
}
