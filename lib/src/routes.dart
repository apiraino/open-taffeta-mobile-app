import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class Routes {
  final Router router = Router();

  /// Small hax : https://github.com/flutter/flutter/issues/31006
  final AuthPage authPage = AuthPage();

  Routes() {
    _defineRoutes();
  }

  void _defineRoutes() {
    router.define(
      AppPaths.pathHome,
      handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          print('Navigate to ${AppPaths.pathHome}');
          return HomePage();
        },
      ),
    );

    router.define(
      AppPaths.pathAuth,
      handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          print('Navigate to ${AppPaths.pathAuth}');
          return AuthPage();
        },
      ),
    );

    router.define(
      AppPaths.pathSettings,
      handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          print('Navigate to ${AppPaths.pathSettings}');
          return SettingsPage();
        },
      ),
    );
  }
}
