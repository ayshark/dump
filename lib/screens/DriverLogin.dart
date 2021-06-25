import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DriverLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage("assets/images/driver_login.png"),
                )),
            SizedBox(
              height: 20,
            ),
            // mobile number input field
            Visibility(
              child: Container(
                  // alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.mobile_friendly),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(45.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Mobile number",
                        fillColor: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              //Password input widget
              child: Container(
                  // alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(45.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Password",
                        fillColor: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              child: Align(
                  //Login button
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("Login"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                    color: Color.fromRGBO(242, 161, 84, 1),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
