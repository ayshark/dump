import 'package:stacked/stacked.dart';
import 'package:dump/services/authServices.dart';
import 'package:dump/services/navigationService.dart';
import 'package:dump/locator.dart';
import 'package:dump/router/pathnames.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  StartUpViewModel() {
    checkUserLoggedIn();
  }

  //checks if user is already logged in or not.
  checkUserLoggedIn() async {
    setBusy(true);
    var isLoggedin = _authService.isLoggedIn();
    if (isLoggedin) {
      setBusy(false);
      Future.delayed(Duration.zero, () {
        _navigationService.navigateTo(DriverHomeViewRoute);
      });
    } else {
      setBusy(false);
    }
  }
}
