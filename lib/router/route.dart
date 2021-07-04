import 'package:dump/screens/StartupPage/StartupView.dart';
import 'package:dump/screens/DriverMainPage/driverMainView.dart';
import 'package:dump/screens/Unfinished%20Screens/Utilities.dart';
import 'package:flutter/material.dart';
import 'pathnames.dart' as routeName;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeName.StartUpRoute:
      return MaterialPageRoute(builder: (context) => StartUpView());
    case routeName.DriverHomeViewRoute:
      return MaterialPageRoute(builder: (context) => DriverHomeView());
    case routeName.UserHomeViewRoute:
      return MaterialPageRoute(builder: (context) => Utilities());
    default:
      return MaterialPageRoute(builder: (context) => StartUpView());
  }
}
