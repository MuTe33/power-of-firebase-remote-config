import 'package:remote_config_tutorial/data/remote_config_repository.dart';

class NameValidator {
  NameValidator(this._remoteConfigRepository);

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
