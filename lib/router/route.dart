import 'package:dump/screens/StartupView.dart';
import 'package:dump/screens/driverMainPage.dart';
import 'package:flutter/material.dart';
import 'pathnames.dart' as routeName;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeName.StartUpRoute:
      return MaterialPageRoute(builder: (context) => StartUpView());
    case routeName.DriverHomeViewRoute:
      return MaterialPageRoute(builder: (context) => DriverHomeView());
    default:
      return MaterialPageRoute(builder: (context) => StartUpView());
  }
}
