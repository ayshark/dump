import 'package:flutter/material.dart';
import 'package:dump/screens/DriverLogin.dart';
import 'package:dump/screens/UserLogin.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Driver button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DriverLogin()));
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
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
                  padding: EdgeInsets.symmetric(vertical: 19, horizontal: 15),
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
