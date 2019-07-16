import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/ui/commons/styles.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:flutter_door_buzzer/src/ui/widgets/bubble_indication_painter.dart';
import 'package:flutter_door_buzzer/src/ui/widgets/login_widget.dart';
import 'package:flutter_door_buzzer/src/ui/widgets/register_widget.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final String _tag = '$_AuthPageState';

  // Variable
  double screenWidth;
  double screenHeight;

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  // Business
  @override
  void initState() {
    print('$_tag:initState()');
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    print('$_tag:dispose()');
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('$_tag:build');
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    screenHeight = (screenHeight > AppStyles.authPageMinHeight)
        ? screenHeight
        : AppStyles.authPageMinHeight;

    return Scaffold(
      backgroundColor: AppStyles.primaryColor,
      body: MultiBlocListener(
        listeners: <BlocListener>[
          BlocListener<AuthenticationEvent, AuthenticationState>(
            bloc: BlocProvider.of<AuthenticationBloc>(context),
            listener: (BuildContext context, AuthenticationState state) {
              if (state is AuthenticationAuthenticated) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppStyles.successColor,
                  content:
                      Text(BuzzerLocalizations.of(context).authLoginSucceed),
                ));
                Future.delayed(const Duration(seconds: 1))
                    .then((_) => Navigator.of(context).pop());
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            child: Stack(
              children: <Widget>[
                _buildHeaderSection(context),
                _buildAuthSection(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      height: screenHeight * 0.25,
      width: screenWidth,
    );
  }

  Widget _buildAuthSection(BuildContext context) {
    return Stack(
      children: [
        _buildAuthPageView(context),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: screenHeight * 0.25,
            ),
            Container(
              width: 300.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0x552B2B2B),
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              ),
              child: CustomPaint(
                painter: TabIndicationPainter(pageController: _pageController),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: _onSignInButtonPress,
                        child: Text(
                          BuzzerLocalizations.of(context).authBubbleLoginCTA,
                          style: TextStyle(
                            color: left,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    //Container(height: 33.0, width: 1.0, color: Colors.white),
                    Expanded(
                      child: FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: _onSignUpButtonPress,
                        child: Text(
                          BuzzerLocalizations.of(context).authBubbleRegisterCTA,
                          style: TextStyle(
                            color: right,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAuthPageView(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (i) {
        if (i == 0) {
          setState(() {
            right = Colors.white;
            left = Colors.black;
          });
        } else if (i == 1) {
          setState(() {
            right = Colors.black;
            left = Colors.white;
          });
        }
      },
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.25,
            ),
            Container(
              height: screenHeight * 0.05,
            ),
            Container(
              height: screenHeight * 0.70,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[LoginWidget()],
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.25,
            ),
            Container(
              height: screenHeight * 0.05,
            ),
            Container(
              height: screenHeight * 0.70,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[RegisterWidget()],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color = Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    final double selectedNess = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    final double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedNess;
    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          elevation: 10.0,
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
