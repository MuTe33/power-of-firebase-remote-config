import 'package:remote_config_tutorial/data/remote_config_repository.dart';

/// Business Logic
///
/// I called this interactor as this class fetches multiple kind of things from
/// the repository
///
/// Usually this class should not fetch multiple stuff, but should have only one concern.
/// So keep in mind to separate concerns if you want to have it clean :)
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
