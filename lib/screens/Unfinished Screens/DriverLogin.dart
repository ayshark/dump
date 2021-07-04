import 'package:dump/router/pathnames.dart';
import 'package:dump/screens/DriverMainPage/driverMainView.dart';
import 'package:dump/services/authServices.dart';
import 'package:dump/services/navigationService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dump/locator.dart';

class DriverLogin extends StatefulWidget {
  @override
  _DriverLoginState createState() => _DriverLoginState();
}

class _DriverLoginState extends State<DriverLogin> {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  bool isOTP = false;
  bool enabled = false;
  String _verificationId = "";
  String _verificationCode = "";

  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _otpController = TextEditingController();

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
                    controller: _phoneNumber,
                    style: TextStyle(fontSize: 18),
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          "+91",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),

                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(45.0),
                        ),
                      ),
                      // hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Mobile number",
                    ),
                  )),
            ),
            InkWell(
              onTap: () async {
                await phoneVerification("+91" + _phoneNumber.text);
              },
              child: Text("Send again"),
            ),

            SizedBox(
              height: 20,
            ),
            // Visibility(
            //   //Password input widget
            //   child: Container(
            //       // alignment: Alignment.center,
            //       margin: const EdgeInsets.only(right: 20, left: 20),
            //       child: TextField(
            //         keyboardType:
            //             TextInputType.numberWithOptions(decimal: false),
            //         decoration: new InputDecoration(
            //             prefixIcon: Icon(Icons.visibility_sharp),
            //             border: new OutlineInputBorder(
            //               borderRadius: const BorderRadius.all(
            //                 const Radius.circular(45.0),
            //               ),
            //             ),
            //             filled: true,
            //             hintStyle: new TextStyle(color: Colors.grey[800]),
            //             hintText: "Password",
            //             fillColor: Colors.white),
            //       )),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Visibility(
            //   child: Align(
            //       //Login button
            //       alignment: Alignment.center,
            //       child: RaisedButton(
            //         onPressed: () {
            //           if (phoneNumber.text.isNotEmpty) {}
            //         },
            //         child: Text("Get OTP"),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(23)),
            //         color: Color.fromRGBO(242, 161, 84, 1),
            //       )),
            // ),
            Visibility(
              visible: !isOTP,
              child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () async {
                      if (_phoneNumber.text.isNotEmpty) {
                        print("+91" + _phoneNumber.text);
                        isOTP = true; // otp field becomes visible
                        enabled = true; // the mobile number field disables
                        setState(() {});
                        // var value = await _authService
                        //     .phoneVerification("+91" + _phoneNumber.text);
                        await phoneVerification("+91" + _phoneNumber.text);
                        print(
                            "Printing value after phoneverification method  verificationId $_verificationId");
                        print(
                            "Printing value after phoneverification method verificationCode $_verificationCode");
                      }
                    },
                    child: Text("Get OTP"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                    color: Color.fromRGBO(242, 161, 84, 1),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              //OTP input widget
              visible: isOTP,
              child: Container(
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    controller: _otpController,
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
                    onPressed: () async {
                      if (_otpController.text.isNotEmpty) {
                        PhoneAuthCredential _phoneAuthCredential =
                            PhoneAuthProvider.credential(
                                verificationId: _verificationId,
                                smsCode: _otpController.text);
                        signInWithcredential(
                            _phoneAuthCredential, DriverHomeViewRoute);
                      }
                    },
                    child: Text("Submit OTP"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                    color: Color.fromRGBO(242, 161, 84, 1),
                  )),
            ),
          ],
        ));
  }

  //phoneVerification method
  // String _verificationId = "", _verificationCode = "";
  phoneVerification(String number) async {
    await _authService.authservice.verifyPhoneNumber(
        timeout: Duration(seconds: 60),
        phoneNumber: number,
        verificationCompleted: (credential) async {
          signInWithcredential(credential, DriverHomeViewRoute);
        },
        verificationFailed: (FirebaseAuthException result) {
          print("Printing verification Failed : ${result.message}");
        },
        codeSent: (String verificationId, resendToken) {
          _verificationId = verificationId;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationCode = verificationId;
          setState(() {});
        });
  }

  //signing in with the user credentials
  signInWithcredential(credential, navigationPathname) async {
    await _authService.authservice
        .signInWithCredential(credential)
        .then((value) => {
              if (value.user != null)
                {_navigationService.navigateTo(navigationPathname)}
            });
  }
}
