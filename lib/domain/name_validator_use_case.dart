import 'package:remote_config_tutorial/data/remote_config_repository.dart';

/// Business Logic
///
/// This class whole purpose is to fetch the regex from repository and valid it.
/// The GetRemoteConfigValuesInteractor could be split like this for example.
class NameValidatorUseCase {
  NameValidatorUseCase(this._remoteConfigRepository);

  final RemoteConfigRepository _remoteConfigRepository;

  bool isNameValid({required String name}) {
    if (name.isEmpty) {
      return false;
    }

    final String nameValidationRegEx =
        _remoteConfigRepository.getNameValidationRegEx();

    final regEx = RegExp(nameValidationRegEx, unicode: true);

    return regEx.hasMatch(name);
  }
}
