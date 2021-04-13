import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:remote_config_tutorial/app/main_app.dart';

void main() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(MainApp()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
