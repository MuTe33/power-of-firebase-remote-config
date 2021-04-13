import 'package:firebase_remote_config/firebase_remote_config.dart';

const featureNewHomeKey = 'feature_new_home';

class RemoteConfigRepository {
  RemoteConfigRepository(this._remoteConfig);

  final RemoteConfig _remoteConfig;

  bool isNewHomeEnabled() {
    return _remoteConfig.getBool(featureNewHomeKey);
  }
}
