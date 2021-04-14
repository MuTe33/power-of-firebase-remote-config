import 'package:remote_config_tutorial/app/view_model_base.dart';
import 'package:remote_config_tutorial/domain/get_remote_config_values.dart';
import 'package:remote_config_tutorial/domain/name_validator.dart';

class HomePageViewModel extends ViewModel {
  HomePageViewModel(
    this._getRemoteConfigValues,
    this._nameValidator,
  );

  final GetRemoteConfigValues _getRemoteConfigValues;
  final NameValidator _nameValidator;

  bool get isNewHomeEnabledFeature {
    return _getRemoteConfigValues.isNewHomeEnabledFeature();
  }

  String get getNameValidationRegEx {
    return _getRemoteConfigValues.getNameValidationRegEx();
  }

  int get getTextFieldLengthLimitationValue {
    return _getRemoteConfigValues.getTextFieldLengthLimitationValue();
  }

  bool isNameValid(String input) {
    return _nameValidator.isNameValid(name: input);
  }
}
