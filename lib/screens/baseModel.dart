import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  bool isBusy = false;
  // @override
  // void notifyListeners() {
  //   // TODO: implement notifyListeners
  //   super.notifyListeners();
  // }

  setBusy(bool value) {
    isBusy = value;
    notifyListeners();
  }
}
