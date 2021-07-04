import 'package:dump/services/dialogService.dart';
import 'package:dump/services/navigationService.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import '../../locator.dart';

class DriverMainPageModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  DriverMainPageModel() {
    checkLocationServiceEnabled();
    checkLocationPermissionEnabled();
    trackLocation();
  }

  var location = Location();
  var _displayLoaction;
  get displayLoaction => _displayLoaction;

  checkLocationServiceEnabled() async {
    var _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      var serviceEnabled = await location.requestService();
      print("service enabled $serviceEnabled");
      if (!serviceEnabled) {
        //TODO: show popup and close the app
        _dialogService.dialog("Required Permission",
            "Without serviceEnabled permission app is not likly to run! ",
            onPressed: () {
          _navigationService.goBack();
          checkLocationPermissionEnabled();
          checkLocationServiceEnabled();
          trackLocation();
        });
      }
    }
  }

  trackLocation() {
    location.onLocationChanged.listen((locationData) {
      _displayLoaction = locationData;
      print("constant keep tracking $_displayLoaction");
      notifyListeners();
    });
  }

  checkLocationPermissionEnabled() async {
    var _permissionEnabled = await location.hasPermission();
    if (_permissionEnabled == PermissionStatus.denied) {
      var requestPermission = await location.requestPermission();
      if (requestPermission == PermissionStatus.denied) {
        _dialogService.dialog("Required Permission",
            "Without this permission app is not likly to run! ", onPressed: () {
          _navigationService.goBack();
          checkLocationPermissionEnabled();
          checkLocationServiceEnabled();
          trackLocation();
        });
      } else {
        return;
      }
    }
  }
}
