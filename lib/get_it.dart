import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_config_tutorial/data/remote_config_default_values.dart';

GetIt getIt = GetIt.instance;
GetIt _getIt = getIt;

void initSyncDependencies() {}

Future<void> initAsyncDependencies() async {
  await _initRemoteConfig();
}

Future<void> _initRemoteConfig() async {
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  await remoteConfig.setDefaults(defaultRemoteConfigValues);

  try {
    await remoteConfig.fetch(expiration: const Duration(hours: 12));
  } catch (e, s) {
    debugPrint('RemoteConfig failed to fetch. Error: $e, Stacktrace: $s');
    rethrow;
  }

  final isActivated = await remoteConfig.activateFetched();
  debugPrint('RemoteConfig refreshed: $isActivated');
  _getIt.registerSingleton(remoteConfig);
}
