import 'package:dump/screens/DriverMainPage/driverMainPageModel.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';

class DriverHomeView extends StatefulWidget {
  const DriverHomeView({Key? key}) : super(key: key);

  @override
  _DriverHomeViewState createState() => _DriverHomeViewState();
}

class _DriverHomeViewState extends State<DriverHomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DriverMainPageModel>.reactive(
        builder: (context, model, _) => Scaffold(
              body: Center(
                child: Text(
                    "Driver home page\nConst Tracking location onchange\n ${model.displayLoaction}"),
              ),
            ),
        viewModelBuilder: () => DriverMainPageModel());
  }
}
