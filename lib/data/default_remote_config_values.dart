import 'package:remote_config_tutorial/data/remote_config_repository.dart';

final defaultRemoteConfigValues = <String, dynamic>{
  featureNewHomeKey: false,
  nameValidationRegExKey: r'^\d{5}$',
  textFieldLengthLimitationValueKey: 8,
};