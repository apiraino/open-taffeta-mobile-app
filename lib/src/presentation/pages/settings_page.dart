import 'package:flutter/material.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class SettingsPage extends StatelessWidget {
  final String _tag = '$SettingsPage';

  SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$_tag:$build');
    return Scaffold(
      appBar: AppBar(
        title: Text(BuzzerLocalizations.of(context).settingsTitle),
      ),
      body: SafeArea(
        left: false,
        right: false,
        child: ListView(
          children: [
            const ThemeSwitchTile(),
            AboutListTile(icon: Icon(Icons.info)),
          ],
        ),
      ),
    );
  }
}
