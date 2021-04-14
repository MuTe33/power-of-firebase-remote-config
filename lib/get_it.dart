import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_config_tutorial/data/default_remote_config_values.dart';
import 'package:remote_config_tutorial/data/remote_config_repository.dart';
import 'package:remote_config_tutorial/domain/get_remote_config_values.dart';
import 'package:remote_config_tutorial/ui/home_page_view_model.dart';

GetIt getIt = GetIt.instance;
GetIt _getIt = getIt;

Future<void> resetDependencies() async {
  await _getIt.reset();
}

void initSyncDependencies() {
  _getIt.registerLazySingleton(() => GetRemoteConfigValues(_getIt.get()));
  _getIt.registerLazySingleton(() => RemoteConfigRepository(_getIt.get()));
  _getIt.registerFactory(() => HomePageViewModel(_getIt.get(), _getIt.get()));
}

Future<void> initAsyncDependencies() async {
  await _initRemoteConfig();
}

Future<void> _initRemoteConfig() async {
  final remoteConfig = await RemoteConfig.instance;

  await remoteConfig.setDefaults(defaultRemoteConfigValues);

  try {
    await remoteConfig.fetch(expiration: const Duration(hours: 12));
  } catch (e) {
    debugPrint('RemoteConfig failed to fetch. Error: $e');
    rethrow;
  }
  await remoteConfig.activateFetched();

  _getIt.registerSingleton(remoteConfig);
}
