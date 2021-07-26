import 'package:flutter/material.dart';
import 'color_range.dart';
import 'logo.dart';
import 'dom.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String valeurChoisie = "Particulier";
  List<String> type = <String>["Particulier", "Commerçant"];
  @override
  Widget build(BuildContext context) {
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
                  "Qui êtes vous ?",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontFamily: 'Comfortaa'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Pour mieux vous connaitre, ils nous faut quelques informations supplémentaires.",
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
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      DropdownButton<String>(
                        value: valeurChoisie,
                        hint: Text("Quel type d'utilisateur êtes vous ?"),
                        onChanged: (String? newValue) {
                          setState(() {
                            valeurChoisie = newValue!;
                          });
                        },
                        items:
                            type.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.black, fontFamily: 'Montserra'),
                          hintText: "Nom",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.black, fontFamily: 'Montserra'),
                          hintText: "Prénom",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.black, fontFamily: 'Montserra'),
                          hintText: "Mot de passe",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.black, fontFamily: 'Montserra'),
                          hintText: "Vérification mot de passe",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
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
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Dom()),
                                  (route) => route.isFirst);
                            },
                            child: Text(
                              "Commencer l'aventure mulmul",
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
