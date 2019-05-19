import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/register/register.dart';
import 'package:flutter_door_buzzer/src/ui/commons/colors.dart';
import 'package:flutter_door_buzzer/src/ui/commons/dimensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

  TextEditingController signupEmailController = new TextEditingController();

//  TextEditingController signupFisrtNameController = new TextEditingController();
//  TextEditingController signupLastNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

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
    RegisterBloc _registerBloc = BlocProvider.of<RegisterBloc>(context);

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
              backgroundColor: AppColors.errorColor,
              content: Text('${state.error.runtimeType}'),
            ),
          );
        }
      },
      child: BlocBuilder<RegisterEvent, RegisterState>(
        bloc: _registerBloc,
        builder: (BuildContext context, RegisterState state) {
          return Card(
            elevation: AppDimensions.defaultCardElevation,
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.defaultCardPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text('Register')),
//                  Padding(
//                    padding:
//                        const EdgeInsets.all( AppDimensions.defaultFormInputPadding),
//                    child: TextFormField(
//                      decoration: InputDecoration(
//                        labelText: 'Firstname',
//                      ),
//                    ),
////                  ),
//                  Padding(
//                    padding:
//                        const EdgeInsets.all( AppDimensions.defaultFormInputPadding),
//                    child: TextFormField(
//                      decoration: InputDecoration(
//                        labelText: 'Lastname',
//                      ),
//                    ),
//                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                        AppDimensions.defaultFormInputPadding),
                    child: TextFormField(
                      controller: signupEmailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'someone@email.com',
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                        AppDimensions.defaultFormInputPadding),
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
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                        AppDimensions.defaultFormInputPadding),
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
                        labelText: 'Password Confirm',
                      ),
                    ),
                  ),
                  MaterialButton(
                    child: Text('REGISTER'),
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
