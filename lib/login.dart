import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mulmul/dom.dart';
import 'color_range.dart';
import 'logo.dart';
import 'dom.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordObs = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: MaterialColor(0xffffefed, color),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        shape: BoxShape.circle,
                        color: AdaptiveTheme.of(context).theme.primaryColor),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 200, height: 200, child: Logo()),
                Text(
                  "Connexion",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontFamily: 'Comfortaa'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Les commerçants n'attendent plus que vous ! ",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black38,
                      fontFamily: 'Montserra'),
                  textAlign: TextAlign.center,
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      InternationalPhoneNumberInput(
                        textFieldController: phoneController,
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          showFlags: false,
                          useEmoji: false,
                          setSelectorButtonAsPrefixIcon: false,
                        ),
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.top,
                        textStyle: TextStyle(
                            color: Colors.black, fontFamily: 'Montserra'),
                        inputDecoration: InputDecoration(
                          hintText: "Numéro de téléphone",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: passwordObs,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(passwordObs
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  passwordObs = !passwordObs;
                                });
                              }),
                          hintStyle: TextStyle(
                              color: Colors.black, fontFamily: 'Montserra'),
                          hintText: "Mot de passe",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                firebase_auth.ConfirmationResult
                                    confirmationResult =
                                    await auth.signInWithPhoneNumber(
                                        phoneController.text);
                                firebase_auth.UserCredential userCredential =
                                    await confirmationResult.confirm('123456');
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => Dom()),
                                    (route) => route.isFirst);
                              } on firebase_auth
                                  .FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print(
                                      'Wrong password provided for that user.');
                                }
                              }
                            },
                            child: Text(
                              "Se connecter",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Montserra'),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)))),
                          )),
                    ],
                  ),
                ),
                Spacer(
                  flex: 6,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
