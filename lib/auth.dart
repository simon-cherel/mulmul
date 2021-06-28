import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //sign in anonymously
  Future signInAnon() async {
    try {} catch (e) {
      print(e.toString());
      return null;
    }
  }
}
