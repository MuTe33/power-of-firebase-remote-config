import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:remote_config_tutorial/app/main_app.dart';
import 'package:remote_config_tutorial/get_it.dart';
import 'package:remote_config_tutorial/get_it.dart' as globals;

void main() {
  globals.startApp = runStage;
  runStage();
}

void runStage() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await resetDependencies();

  initSyncDependencies();
  await initAsyncDependencies();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(
      MainApp(
        appBarTitle: 'STAGE App',
        key: UniqueKey(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
