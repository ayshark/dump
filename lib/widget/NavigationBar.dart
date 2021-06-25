import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dump/screens/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dump/screens/ResidentLocation.dart';
import 'package:dump/screens/Utilities.dart';

class NavigationBar extends StatefulWidget {
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  var _page=0;
  final pages= [ResidentLocation(), Utilities(),Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(

          index: 1,
          buttonBackgroundColor: Color.fromRGBO(48, 72, 75, 1),
          color: Color.fromRGBO(48, 72, 75, 1),
          backgroundColor: Colors.white,

          items: [
            Icon(Icons.add_location,color: Colors.white,size: 40,),
            Icon(Icons.add,color: Colors.white,size: 40,),
            Icon(Icons.settings,color: Colors.white,size: 40),
          ],
          onTap: (index){
            setState(() {
              _page=index;
            });
          }
      ),
      body: pages[_page],
    );
  }
}