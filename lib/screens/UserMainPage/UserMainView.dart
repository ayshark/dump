import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dump/screens/Unfinished Screens/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dump/screens/Unfinished Screens/ResidentLocation.dart';
import 'package:dump/screens/Unfinished Screens/Utilities.dart';

class UserMainView extends StatefulWidget {
  _UserMainViewState createState() => _UserMainViewState();
}

class _UserMainViewState extends State<UserMainView> {
  var _page = 0;
  final pages = [ResidentLocation(), Utilities(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          buttonBackgroundColor: Color.fromRGBO(48, 72, 75, 1),
          color: Color.fromRGBO(48, 72, 75, 1),
          backgroundColor: Colors.white,
          items: [
            Icon(
              Icons.add_location,
              color: Colors.white,
              size: 40,
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
            Icon(Icons.settings, color: Colors.white, size: 40),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          }),
      body: pages[_page],
    );
  }
}
