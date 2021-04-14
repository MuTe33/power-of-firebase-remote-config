import 'package:firebase_remote_config/firebase_remote_config.dart';

const featureNewHomeKey = 'feature_new_home';
const nameValidationRegExKey = 'name_validation_reg_ex';
const textFieldLengthLimitationValueKey = 'text_field_length_limitation_value';

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
