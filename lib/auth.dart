import 'package:flutter/material.dart';

import 'welcome.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key, required this.home}) : super(key: key);
  final Widget home;
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return Welcome();
  }

  // Future<void> verifyPhone() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phone,
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //         final snackBar = SnackBar(content: Text("Login Success"));
  //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         final snackBar = SnackBar(content: Text("${e.message}"));
  //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       },
  //       codeSent: (String verficationId, int resendToken) {
  //         setState(() {
  //           codeSent = true;
  //           verId = verficationId;
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         setState(() {
  //           verId = verificationId;
  //         });
  //       },
  //       timeout: Duration(seconds: 60));
  // }

  // Future<void> verifyPin(String pin) async {
  //   PhoneAuthCredential credential =
  //       PhoneAuthProvider.credential(verificationId: verId, smsCode: pin);

  //   try {
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     final snackBar = SnackBar(content: Text("Login Success"));
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   } on FirebaseAuthException catch (e) {
  //     final snackBar = SnackBar(content: Text("${e.message}"));
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   }
}
