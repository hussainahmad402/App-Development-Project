import 'package:chat/core/others/base_viewmodel.dart';

class BottomNavigationViewmodel extends BaseViewmodel {
  int _currentindex = 1;
  int get currentIndex => _currentindex;

  setIndex(int value) {
    if (_currentindex != value) {
      _currentindex = value;
      notifyListeners();
    }
  }
}
