import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/src/ui/commons/paths.dart';
import 'package:flutter_door_buzzer/src/ui/widgets/menu_bottom_sheet_widget.dart';

void navigateToLogin(BuildContext context) {
  Navigator.of(context).pushNamed(AppPaths.pathAuth);
}

void navigateToSettings(BuildContext context) {
  Navigator.of(context).pushNamed(AppPaths.pathSettings);
}

void openMenuBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => MenuBottomSheet(),
  );
}
