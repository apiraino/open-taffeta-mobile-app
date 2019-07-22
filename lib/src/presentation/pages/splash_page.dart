import 'package:flutter/material.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class SplashPage extends StatelessWidget {
  final String _tag = '$SplashPage';

  @override
  Widget build(BuildContext context) {
    print('$_tag:build');

    return Scaffold(
      backgroundColor: AppStyles.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircularProgressIndicator(),
            Text('BUZZER DOOR'),
          ],
        ),
      ),
    );
  }
}
