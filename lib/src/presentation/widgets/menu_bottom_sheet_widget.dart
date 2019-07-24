import 'package:flutter/material.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({
    Key key,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(10.0),
      topRight: Radius.circular(10.0),
    ),
  }) : super(key: key);

  final Color backgroundColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      child: Wrap(
        children: <Widget>[
          const AccountTile(),
          Divider(),
          const ThemeSwitchTile(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(BuzzerLocalizations.of(context).settingsCTA),
            onTap: () => navigateToSettings(context),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text(BuzzerLocalizations.of(context).menuPPCTA),
                onPressed: null,
              ),
              const Text('·'),
              MaterialButton(
                child: Text(BuzzerLocalizations.of(context).menuToSCTA),
                onPressed: null,
              ),
            ],
          )
        ],
      ),
    );
  }
}
