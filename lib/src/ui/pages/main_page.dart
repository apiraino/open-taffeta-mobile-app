import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/ui/commons/colors.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:flutter_door_buzzer/src/ui/pages/account_pages.dart';
import 'package:flutter_door_buzzer/src/ui/pages/home_page.dart';
import 'package:flutter_door_buzzer/src/ui/widgets/menu_button_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key key,
    this.selectedIndex = 0,
  }) : super(key: key);
  final int selectedIndex;

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final String _tag = 'MainPage';
  int selectedIndex;

  final _widgetOptions = [
    HomePage(),
    AccountPage(),
  ];

  @override
  void initState() {
    this.selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('$_tag:$build');

    return Scaffold(
      appBar: AppBar(
        title: Text(BuzzerLocalizations.of(context).appName),
        centerTitle: true,
        actions: [
          MenuButton(),
        ],
      ),
      body: BlocListener<AuthenticationEvent, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        listener: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationAuthenticated) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.successColor,
                content: Text('Authenticated'),
              ),
            );
          } else if (state is AuthenticationUnauthenticated) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.warningColor,
                content: Text('Not authenticated'),
              ),
            );
          }
        },
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        fixedColor: AppColors.colorWhite,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.homeOutline),
            title: Text(BuzzerLocalizations.of(context).homeCTA),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountOutline),
            title: Text(BuzzerLocalizations.of(context).accountCTA),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
