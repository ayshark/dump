import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get authservice => _auth;

  String _verificationId = "", _verificationCode = "";

  //phoneVerification method sent a OTP to number to verify the user.
  phoneVerification(String number) async {
    await authservice.verifyPhoneNumber(
        timeout: Duration(seconds: 60),
        phoneNumber: number,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential).then((value) async {
            if (value.user != null) {
              print("user logged in");
            }
          });
        },
        verificationFailed: (result) {
          print("Printing verification Failed : $result");
        },
        codeSent: (String verificationId, resendToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationCode = verificationId;
        });
    return [
      {"verificationId": _verificationId, "verificationCode": _verificationCode}
    ];
  }

  //signup method not used in this app!.
  void signUp() {}

  //method to check user is already logged in or not
  bool isLoggedIn() {
    var user = _auth.currentUser;
    print("is Logged In check : $user");
    if (user?.uid != null) {
      print(" is log $user");
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
