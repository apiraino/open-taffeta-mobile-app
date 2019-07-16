import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/login/login.dart';
import 'package:flutter_door_buzzer/src/ui/commons/styles.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final String _tag = '$_LoginWidgetState';

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  bool _obscureTextLogin = true;

  @override
  void dispose() {
    print('$_tag:$dispose()');
    loginEmailController.dispose();
    loginPasswordController.dispose();
    myFocusNodeEmailLogin.dispose();
    myFocusNodePasswordLogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('$_tag:$build');
    final LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);

    void _loginPressed() {
      _loginBloc.dispatch(LoginButtonPressed(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      ));
    }

    return BlocListener<LoginEvent, LoginState>(
      bloc: _loginBloc,
      listener: (BuildContext context, LoginState state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppStyles.errorColor,
              content: Text('${state.error.runtimeType}'),
            ),
          );
        }
      },
      child: BlocBuilder<LoginEvent, LoginState>(
        bloc: _loginBloc,
        builder: (BuildContext context, LoginState state) {
          return Card(
            elevation: AppStyles.cardDefaultElevation,
            child: Padding(
              padding: AppStyles.cardDefaultPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
//                  Center(
//                    child: Text(BuzzerLocalizations.of(context)
//                        .authLoginTitle
//                        .toUpperCase()),
//                  ),
                  Padding(
                    padding: AppStyles.formDefaultInputPadding,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: loginEmailController,
                      decoration: InputDecoration(
                        hintText: BuzzerLocalizations.of(context).formEmailHint,
                        labelText:
                            BuzzerLocalizations.of(context).formEmailLabel,
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppStyles.formDefaultInputPadding,
                    child: TextFormField(
                      controller: loginPasswordController,
                      obscureText: _obscureTextLogin,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_obscureTextLogin
                              ? MdiIcons.eyeOffOutline
                              : MdiIcons.eyeOutline),
                          onPressed: _toggleLoginPassword,
                        ),
                        labelText:
                            BuzzerLocalizations.of(context).formPasswordLabel,
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text(BuzzerLocalizations.of(context).authLoginCTA),
                    onPressed: state is! LoginLoading ? _loginPressed : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _toggleLoginPassword() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }
}
