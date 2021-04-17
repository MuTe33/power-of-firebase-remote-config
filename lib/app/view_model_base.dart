import 'package:flutter/foundation.dart';

/// The 3 main states our application will have
enum ViewState { idle, loading, error }

/// Every widget's view model will extends this class to have
/// some abilities to change and update the state
abstract class ViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  bool _mounted = true;

  ViewState get state => _state;

  void _setState(ViewState viewState) {
    if (_mounted) {
      _state = viewState;
      notifyListeners();
    }
  }

  void update() {
    if (_mounted) {
      notifyListeners();
    }
  }

  void setLoading() => _setState(ViewState.loading);

  void setIdle() => _setState(ViewState.idle);

  void setError() => _setState(ViewState.error);

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
