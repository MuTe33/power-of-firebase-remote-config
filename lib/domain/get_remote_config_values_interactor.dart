import 'package:remote_config_tutorial/data/remote_config_repository.dart';

class GetRemoteConfigValuesInteractor {
  GetRemoteConfigValuesInteractor(this._remoteConfigRepository);

  final RemoteConfigRepository _remoteConfigRepository;

  bool isNewHomeEnabledFeature() {
    return _remoteConfigRepository.isNewHomeFeatureEnabled();
  }

  String getNameValidationRegEx() {
    return _remoteConfigRepository.getNameValidationRegEx();
  }

  int getTextFieldLengthLimitationValue() {
    return _remoteConfigRepository.getTextFieldLengthLimitationValue();
  }
}
