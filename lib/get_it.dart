import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_config_tutorial/data/default_remote_config_values.dart';
import 'package:remote_config_tutorial/data/remote_config_repository.dart';
import 'package:remote_config_tutorial/domain/get_remote_config_values_interactor.dart';
import 'package:remote_config_tutorial/domain/name_validator_use_case.dart';
import 'package:remote_config_tutorial/ui/home_page_view_model.dart';

Function()? startApp;

// Dependency Injection
// Here all objects are initialized with the right dependencies

GetIt getIt = GetIt.instance;
GetIt _getIt = getIt;

Future<void> resetDependencies() async {
  await _getIt.reset();
}

void initSyncDependencies() {
  _getIt.registerLazySingleton(() => RemoteConfigRepository(_getIt.get()));
  _getIt.registerLazySingleton(
      () => GetRemoteConfigValuesInteractor(_getIt.get()));
  _getIt.registerLazySingleton(() => NameValidatorUseCase(_getIt.get()));
  _getIt.registerFactory(() => HomePageViewModel(_getIt.get(), _getIt.get()));
}

Future<void> initAsyncDependencies() async {
  await _initRemoteConfig();
}

// First we set the default which we defined in our app
// than we try to fetch remote config values from firebase
// optionally we print out whether new values were fetched
// finally we register the remote config object with the newly fetched values
Future<void> _initRemoteConfig() async {
  final remoteConfig = await RemoteConfig.instance;

  await remoteConfig.setDefaults(defaultRemoteConfigValues);

  try {
    await remoteConfig.fetch(expiration: const Duration(seconds: 1));
  } catch (e) {
    debugPrint('RemoteConfig failed to fetch. Error: $e');
    rethrow;
  }

  final isActivated = await remoteConfig.activateFetched();
  debugPrint('RemoteConfig refreshed: $isActivated');

  _getIt.registerSingleton(remoteConfig);
}
