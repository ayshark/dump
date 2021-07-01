import 'package:dump/locator.dart';
import 'package:dump/services/authServices.dart';
import 'package:dump/widget/NavigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final AuthService _authService = locator<AuthService>();
  bool isOTP = false; // flag to make the otp field visible
  bool enabled = false; // flag to disable the mobile number input widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage("assets/images/user_login.png"),
                )),
            SizedBox(
              height: 20,
            ),
            // mobile number input field
            Visibility(
              child: Container(
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.mobile_friendly_rounded),
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
            //get-OTP button
            Visibility(
              visible: !isOTP,
              child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      isOTP = true; // otp field becomes visible
                      enabled = true; // the mobile number field disables
                      setState(() {
                        //
                      });
                    },
                    child: Text("Get OTP"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                    color: Color.fromRGBO(242, 161, 84, 1),
                  )),
            ),
            Visibility(
              //OTP input widget
              visible: isOTP,
              child: Container(
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.visibility_off),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(45.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Enter OTP",
                        fillColor: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: isOTP,
              child: Align(
                  //submit-OTP button
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => NavigationBar()));
                    },
                    child: Text("Submit OTP"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                    color: Color.fromRGBO(242, 161, 84, 1),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    child: SelectableText.rich(TextSpan(children: [
                      TextSpan(text: 'Do not have an account? '),
                      TextSpan(
                        text: 'Sign up.',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        // mouseCursor: SystemMouseCursors.click,
                      )
                    ]))))
          ],
        ));
  }

  //phoneVerification method
  String _verificationId = "", _verificationCode = "";
  _phoneVerification(String number) async {
    await _authService.authservice.verifyPhoneNumber(
        timeout: Duration(seconds: 60),
        phoneNumber: number,
        verificationCompleted: (value) {
          print("Printing verification completed : $value");
        },
        verificationFailed: (result) {
          print("Printing verification Failed : $result");
        },
        codeSent: (String verificationId, resendToken) {
          _verificationId = verificationId;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationCode = verificationId;
        });
  }
}
