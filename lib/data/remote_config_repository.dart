import 'package:firebase_remote_config/firebase_remote_config.dart';

// Important note: these key names must match key names in remote config
const featureNewHomeKey = 'feature_new_home';
const nameValidationRegExKey = 'name_validation_reg_ex';
const textFieldLengthLimitationValueKey = 'text_field_length_limitation_value';

/// This repository's purpose is to fetch data from firebase remote config
class RemoteConfigRepository {
  RemoteConfigRepository(this._remoteConfig);

  final RemoteConfig _remoteConfig;

  bool isNewHomeFeatureEnabled() {
    return _remoteConfig.getBool(featureNewHomeKey);
  }

  String getNameValidationRegEx() {
    return _remoteConfig.getString(nameValidationRegExKey);
  }

  int getTextFieldLengthLimitationValue() {
    return _remoteConfig.getInt(textFieldLengthLimitationValueKey);
  }
}
