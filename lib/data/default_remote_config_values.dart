import 'package:remote_config_tutorial/data/remote_config_repository.dart';

// these are default values for remote config values which get set in the locator
// Probably cleaner to have it in a class
final defaultRemoteConfigValues = <String, dynamic>{
  featureNewHomeKey: false,
  nameValidationRegExKey: r'^\d{5}$',
  textFieldLengthLimitationValueKey: 8,
};
