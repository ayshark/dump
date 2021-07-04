import 'package:dump/screens/StartupPage/StartupView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 24,
          ),

          //user info
          SizedBox(
            width: 355,
            height: 140,
            child: RaisedButton(
                onPressed: () {
                  print("button clicked");
                },
                color: Color.fromRGBO(48, 72, 75, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                    Positioned(
                      top: 45,
                      left: 110,
                      child: Text(
                        'Thameena Abeer',
                        style: GoogleFonts.roboto(
                            fontSize: 24, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 75,
                      left: 110,
                      child: Text(
                        '+91 98793 89797',
                        style: GoogleFonts.roboto(
                            fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                )),
          ),

          SizedBox(
            height: 30,
          ),

          //set location field
          SizedBox(
            width: 354,
            height: 55,
            child: RaisedButton(
                onPressed: () {
                  null;
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 9,
                      child: Icon(
                        Icons.add_location_alt_outlined,
                        color: Colors.black,
                        size: 36,
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 17,
                      child: Text(
                        'Set Location',
                        style: GoogleFonts.roboto(
                            fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                )),
          ),

          SizedBox(
            height: 20,
          ),

          //notifications field
          SizedBox(
            width: 354,
            height: 55,
            child: RaisedButton(
                onPressed: () {
                  print("button clicked");
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 9,
                      child: Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.black,
                        size: 36,
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 17,
                      child: Text(
                        'Notifications',
                        style: GoogleFonts.roboto(
                            fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 250,
                      child: ToggleSwitch(
                        minWidth: 28.0,
                        minHeight: 25.0,
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [Colors.white],
                          [Colors.white]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Color.fromRGBO(48, 72, 75, 1),
                        inactiveFgColor: Colors.white,
                        borderWidth: 4,
                        borderColor: [Color.fromRGBO(48, 72, 75, 1)],
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        radiusStyle: true,
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),
                    ),
                  ],
                )),
          ),

          SizedBox(
            height: 20,
          ),

          //invite friends field
          SizedBox(
            width: 354,
            height: 55,
            child: MaterialButton(
                onPressed: () {
                  Share.share('Invite Friends Via..');
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 9,
                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                        size: 36,
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 17,
                      child: Text(
                        'Invite Friends',
                        style: GoogleFonts.roboto(
                            fontSize: 18, color: Colors.black),
                      ),
                    )
                  ],
                )),
          ),

          SizedBox(
            height: 20,
          ),

          //about us field
          SizedBox(
            width: 354,
            height: 55,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => aboutUs()));
                  print("button clicked");
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 9,
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.black,
                        size: 36,
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 17,
                      child: Text(
                        'About us',
                        style: GoogleFonts.roboto(
                            fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                )),
          ),

          SizedBox(
            height: 20,
          ),

          //logout field
          SizedBox(
            width: 354,
            height: 55,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartUpView()));
                  print("button clicked");
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 9,
                      child: Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 36,
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 17,
                      child: Text(
                        'Logout',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )),
          ),

          SizedBox(
            height: 20,
          ),

          //version text
          Container(
            child: Text(
              'Version: 1.0.0.5',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          )
        ],
      )),
    );
  }
}

class aboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                  child: RichText(
                text: TextSpan(
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'We Are Loyal to Our Core Values\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'We are dedicated to our fundamental beliefs that give included advantages '
                              'in our customers business that extend past the underlying venture, be it in website '
                              'composition or a versatile application advancement venture.\n\n'),
                      TextSpan(
                          text:
                              'We Build Strong Relationships. We put vigorously in building long haul '
                              'connections by giving quality, client encounters, and execution in your product items.'),
                      TextSpan(
                          text: '\n\nWe Are Quality Conscious\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'We adore quality searchers. Henceforth, our prime center is programming '
                              'quality that wins us some genuine praises from customers and their end-clients.'),
                      TextSpan(
                          text: '\n\nWe Are Creative and Innovative\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Our capacities to thoroughly consider of-box bring advancement, upheaval,'
                              ' and uniqueness even by pushing the limits somewhat more distant than anybody can.'),
                      TextSpan(
                          text: '\n\nOur Mission\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'To decide our strength in the present and up and coming programming '
                              'innovations by conveying modern arrangements that keeping them serving and remaining '
                              'for more.'),
                      TextSpan(
                          text: '\n\nOur Vision\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'To acquire profound respect from the supporters over the globe and distinctive'
                              ' verticals of the business by conveying intriguing yet answers for their issues/challenges.'),
                      TextSpan(
                          text:
                              '\n\nCopyright © [DAMN group of industries] [2020-2040]All Rights Reserved\n\n',
                          style: TextStyle(fontSize: 14)),
                    ]),
              )),
            )));
  }
}
