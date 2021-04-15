import 'package:remote_config_tutorial/app/view_model_base.dart';
import 'package:remote_config_tutorial/domain/get_remote_config_values_interactor.dart';
import 'package:remote_config_tutorial/domain/name_validator_use_case.dart';

class HomePageViewModel extends ViewModel {
  HomePageViewModel(
    this._getRemoteConfigValuesInteractor,
    this._nameValidatorUseCase,
  );

  final GetRemoteConfigValuesInteractor _getRemoteConfigValuesInteractor;
  final NameValidatorUseCase _nameValidatorUseCase;

  bool get isNewHomeEnabledFeature {
    return _getRemoteConfigValuesInteractor.isNewHomeEnabledFeature();
  }

  String get getNameValidationRegEx {
    return _getRemoteConfigValuesInteractor.getNameValidationRegEx();
  }

  int get getTextFieldLengthLimitationValue {
    return _getRemoteConfigValuesInteractor.getTextFieldLengthLimitationValue();
  }

  bool isNameValid(String input) {
    return _nameValidatorUseCase.isNameValid(name: input);
  }
}
