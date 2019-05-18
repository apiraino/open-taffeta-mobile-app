import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/account/account_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/application/application.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/login/login.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/register/register.dart';
import 'package:flutter_door_buzzer/src/routes.dart';
import 'package:flutter_door_buzzer/src/ui/commons/colors.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:flutter_door_buzzer/src/ui/pages/main_page.dart';
import 'package:flutter_door_buzzer/src/ui/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/repositories/buzzer_repository.dart';
import 'data/repositories/preferences_repository.dart';
import 'domain/blocs/configuration/configuration.dart';

/// This App wrap all the configuration logic with [ConfigurationBloc]
class ConfigurationWrapperApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConfigurationWrapperAppState();
}

class _ConfigurationWrapperAppState extends State<ConfigurationWrapperApp> {
  final String _tag = '_ConfigurationWrapperAppState';

  /// Blocs
  ConfigurationBloc _configBloc;

  @override
  void initState() {
    super.initState();

    _configBloc = ConfigurationBloc();
    _configBloc.dispatch(AppLaunched());
  }

  @override
  void dispose() {
    _configBloc?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurationEvent, ConfigurationState>(
      bloc: _configBloc,
      builder: (BuildContext context, ConfigurationState state) {
        if (state is ConfigLoading) {
          return WidgetsApp(
            initialRoute: '/',
            home: SplashPage(),
            color: AppColors.primaryColor,
          );
        } else if (state is ConfigLoaded) {
          return BlocProvider<ConfigurationBloc>(
            bloc: _configBloc,
            child: _ConfiguredApp(state),
          );
        }
        return Container();
      },
    );
  }
}

/// This is the wrapper of the App with all configurations
///
/// It injects :
/// - managers
/// - repositories
/// - blocs
class _ConfiguredApp extends StatefulWidget {
  final ConfigLoaded state;

  _ConfiguredApp(this.state);

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

    _appBloc =
        ApplicationBloc(preferencesRepository: _state.preferencesRepository);

    _accountBloc = AccountBloc(buzzerRepository: _state.buzzerRepository);

    _authBloc = AuthenticationBloc(
      preferencesRepository: _state.preferencesRepository,
      buzzerRepository: _state.buzzerRepository,
      accountBloc: _accountBloc,
    );

    _loginBloc = LoginBloc(
      buzzerRepository: _state.buzzerRepository,
      authBloc: _authBloc,
    );

    _registerBloc = RegisterBloc(
      buzzerRepository: _state.buzzerRepository,
      authBloc: _authBloc,
    );

    _authBloc.dispatch(AppStarted());
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
    /// Dependency Injection of all Repositories and global Blocs

    return MultiProvider(
      providers: [
        Provider<BuzzerRepository>.value(value: widget.state.buzzerRepository),
        Provider<PreferencesRepository>.value(
            value: widget.state.preferencesRepository),
      ],
      child: BlocProviderTree(
        blocProviders: <BlocProvider>[
          BlocProvider<ApplicationBloc>(bloc: _appBloc),
          BlocProvider<AuthenticationBloc>(bloc: _authBloc),
          BlocProvider<LoginBloc>(bloc: _loginBloc),
          BlocProvider<RegisterBloc>(bloc: _registerBloc),
          BlocProvider<AccountBloc>(bloc: _accountBloc),
        ],
        child: BlocBuilder<ApplicationEvent, ApplicationState>(
          bloc: _appBloc,
          builder: (BuildContext context, ApplicationState state) {
            if (state is AppLoading) {
              return WidgetsApp(
                home: SplashPage(),
                color: AppColors.primaryColor,
              );
            } else if (state is AppInitialized) {
              return _ThemedApp(state);
            } else if (state is AppFailure) {
              return WidgetsApp(
                home: Scaffold(
                  body: Text('${state.error.runtimeType} error'),
                ),
                color: AppColors.primaryColor,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

/// This is the final app with all UI preferences
class _ThemedApp extends StatelessWidget {
  final String _tag = '$_ThemedApp';

  final AppInitialized appState;

  _ThemedApp(this.appState);

  @override
  Widget build(BuildContext context) {
    print('$_tag:$build');

    /// Routes
    Routes routes = Routes();

    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          BuzzerLocalizations.of(context).appName,
      theme: _buildCVTheme(appState.theme),
      home: MainPage(),

      /// Use Fluro routes
      onGenerateRoute: routes.router.generator,

      localizationsDelegates: [
        const BuzzerLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('de'),
        const Locale('fr'),
      ],
      debugShowCheckedModeBanner: false,

      ///showSemanticsDebugger: true,
    );
  }

  ThemeData _buildCVTheme(String theme) {
    ThemeData base;
    if (theme != ThemeType.DARK)
      base = ThemeData.light();
    else {
      base = ThemeData.dark();
    }

    return base.copyWith(
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColorLight,
      primaryColorDark: AppColors.primaryColorDark,
      accentColor: AppColors.accentColor,
      buttonColor: (theme != ThemeType.DARK)
          ? AppColors.colorWhite
          : AppColors.primaryColorDark,
      inputDecorationTheme: InputDecorationTheme(
        hasFloatingPlaceholder: true,
        border: OutlineInputBorder(),
      ),
      textTheme: _buildCVTextTheme(base.textTheme),
      primaryTextTheme: _buildCVTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildCVTextTheme(base.accentTextTheme),
      iconTheme: IconThemeData(),
    );
  }

  TextTheme _buildCVTextTheme(TextTheme base) {
    return base.apply(
      fontFamily: 'Arial',
    );
  }
}
