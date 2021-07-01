import 'package:dump/locator.dart';
import 'package:dump/router/pathnames.dart';
import 'package:dump/services/authServices.dart';
import 'package:dump/services/navigationService.dart';
import 'package:flutter/material.dart';
import 'package:dump/screens/DriverLogin.dart';
import 'package:dump/screens/UserLogin.dart';

class StartUpView extends StatefulWidget {
  @override
  _StartUpViewState createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  bool isBusy = false;
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  //method to set indication state being busy or not.
  setBusy(bool value) {
    setState(() {
      isBusy = value;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isBusy
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Driver button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DriverLogin()));
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 130,
                        ),
                        Text("Driver",
                            style: TextStyle(color: Colors.white, fontSize: 25))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //Resident button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserLogin()));
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.house,
                          color: Colors.white,
                          size: 115,
                        ),
                        Text("Resident",
                            style: TextStyle(color: Colors.white, fontSize: 25))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 19, horizontal: 15),
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ],
              ),
      ),
    );
  }
}
