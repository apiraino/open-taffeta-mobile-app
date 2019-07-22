import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/bloc.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class RegisterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterWidget();
}

class _RegisterWidget extends State<RegisterWidget> {
  final String _tag = '_RegisterWidget';

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();

//  final FocusNode myFocusNodeFirstName = FocusNode();
//  final FocusNode myFocusNodeLastName = FocusNode();

  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = TextEditingController();

//  TextEditingController signupFisrtNameController = new TextEditingController();
//  TextEditingController signupLastNameController = new TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    print('$_tag:$dispose()');

//    myFocusNodeFirstName.dispose();
//    myFocusNodeLastName.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('$_tag:$build');
    final RegisterBloc _registerBloc = BlocProvider.of<RegisterBloc>(context);

    void _registerPressed() {
      _registerBloc.dispatch(RegisterButtonPressed(
        email: signupEmailController.text,
        password: signupPasswordController.text,
      ));
    }

    return BlocListener<RegisterEvent, RegisterState>(
      bloc: _registerBloc,
      listener: (BuildContext context, RegisterState state) {
        if (state is RegisterFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppStyles.errorColor,
              content: Text('${state.error.runtimeType}'),
            ),
          );
        }
      },
      child: BlocBuilder<RegisterEvent, RegisterState>(
        bloc: _registerBloc,
        builder: (BuildContext context, RegisterState state) {
          return Card(
            elevation: AppStyles.cardDefaultElevation,
            child: Padding(
              padding: AppStyles.formDefaultInputPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
//                  Center(
//                    child: Text(
//                      BuzzerLocalizations.of(context)
//                          .authRegisterTitle
//                          .toUpperCase(),
//                      style: TextStyle(fontWeight: FontWeight.bold),
//                    ),
//                  ),
                  Padding(
                    padding: AppStyles.formDefaultInputPadding,
                    child: TextFormField(
                      controller: signupEmailController,
                      keyboardType: TextInputType.emailAddress,
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
                      controller: signupPasswordController,
                      obscureText: _obscureTextSignup,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_obscureTextSignup
                              ? MdiIcons.eyeOffOutline
                              : MdiIcons.eyeOutline),
                          onPressed: _toggleSignup,
                        ),
                        labelText:
                            BuzzerLocalizations.of(context).formPasswordLabel,
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppStyles.formDefaultInputPadding,
                    child: TextFormField(
                      controller: signupConfirmPasswordController,
                      obscureText: _obscureTextSignupConfirm,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_obscureTextSignupConfirm
                              ? MdiIcons.eyeOffOutline
                              : MdiIcons.eyeOutline),
                          onPressed: _toggleSignupConfirm,
                        ),
                        labelText:
                            BuzzerLocalizations.of(context).formPassword2Label,
                      ),
                    ),
                  ),
                  RaisedButton(
                    child:
                        Text(BuzzerLocalizations.of(context).authRegisterCTA),
                    onPressed:
                        state is! RegisterLoading ? _registerPressed : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }
}
