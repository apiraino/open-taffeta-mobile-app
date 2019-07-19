import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_door_buzzer/src/app.dart';

/// TODO : automatically set this to false for release builds
const DEBUG_MODE = true;
const DEBUG_PAINT_SIZE = false;

void main() async {
  void run() async {
    runApp(ConfigurationWrapper());
  }

  if (DEBUG_MODE) {
    debugPaintSizeEnabled = DEBUG_PAINT_SIZE;
    run();
  } else {
    FlutterError.onError = globalErrorHandler;
    runZoned(run, onError: globalErrorHandler);
  }
}

/// Global error handler. Show stack trace
void globalErrorHandler(dynamic details) {
  StackTrace stackTrace;

  if (details is FlutterErrorDetails) {
    if (details.exception is Error) {
      stackTrace = details.stack;
    }
  } else if (details is Error) {
    stackTrace = details.stackTrace;
  } else {
    throw details;
  }

  print(stackTrace);
}
