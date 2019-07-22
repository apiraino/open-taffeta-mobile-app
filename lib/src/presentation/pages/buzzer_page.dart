import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/bloc.dart';
import 'package:flutter_door_buzzer/domain.dart';
import 'package:flutter_door_buzzer/presentation.dart';
import 'package:provider/provider.dart';

class BuzzerPage extends StatefulWidget {
  @override
  _BuzzerPageState createState() => _BuzzerPageState();
}

class _BuzzerPageState extends State<BuzzerPage> {
  BuzzerBloc buzzerBloc;

  @override
  void didChangeDependencies() {
    /// Init buzzerBloc here instead initState because we need the context to
    /// get dependencies

    final BuzzerRepository buzzerRepository =
        Provider.of<BuzzerRepository>(context);
    final ConfigRepository configRepository =
        Provider.of<ConfigRepository>(context);

    buzzerBloc = BuzzerBloc(
      buzzerRepository: buzzerRepository,
      configRepository: configRepository,
    );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    buzzerBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoorEvent, DoorState>(
      bloc: buzzerBloc,
      listener: (BuildContext context, DoorState state) {
        if (state is DoorSucceed) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${BuzzerLocalizations.of(context).buzzerDoorSucceed} : ${state.message}'),
              backgroundColor: AppStyles.successColor,
            ),
          );
        } else if (state is DoorFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${BuzzerLocalizations.of(context).buzzerDoorFailed} : ${state.error?.message ?? state.error?.runtimeType}'),
              backgroundColor: AppStyles.errorColor,
            ),
          );
        }
      },
      child: BlocBuilder(
        bloc: buzzerBloc,
        builder: (BuildContext context, DoorState state) {
          if (state is DoorLoading) {
            return Center(child: const CircularProgressIndicator());
          } else {
            Icon icon = Icon(MdiIcons.doorClosed);
            if (state is DoorSucceed) icon = Icon(MdiIcons.doorOpen);
            if (state is DoorFailure) icon = Icon(MdiIcons.informationOutline);
            return Center(
              child: IconButton(
                tooltip: BuzzerLocalizations.of(context).buzzerDoorCTA,
                iconSize: 100,
                icon: icon,
                onPressed: () => buzzerBloc.dispatch(DoorBuzzed()),
              ),
            );
          }
        },
      ),
    );
  }
}
