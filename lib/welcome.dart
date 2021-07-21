import 'package:flutter/material.dart';
import 'color_range.dart';
import 'logo.dart';
import 'login.dart';
import 'register_num.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

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
                Spacer(
                  flex: 6,
                ),
                SizedBox(width: 300, height: 300, child: Logo()),
                Spacer(flex: 4),
                Text(
                  "Commençons",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontFamily: 'Comfortaa'),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "Rencontrez vos commerçants dès maintenant",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black38,
                      fontFamily: 'Montserra'),
                ),
                Spacer(
                  flex: 4,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterNum()));
                      },
                      child: Text(
                        "Créer un compte",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserra'),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)))),
                    )),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Se connecter",
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'Montserra'),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            MaterialColor(0xffffb6af, color)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)))),
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
