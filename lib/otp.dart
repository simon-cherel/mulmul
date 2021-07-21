import 'package:flutter/material.dart';
import 'package:mulmul/register_form.dart';
import 'color_range.dart';
import 'logo.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                      size: 32,
                    ),
                  ),
                ),
                SizedBox(width: 200, height: 200, child: Logo()),
                Text(
                  "Vérification",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontFamily: 'Comfortaa'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Entrer votre code de vérification",
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
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width - 48,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth:
                            (MediaQuery.of(context).size.width - 48) * 0.8 / 6,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 15,
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterForm()));
                            },
                            child: Text(
                              "Vérifier",
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
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Vous n'avez pas reçu de code ?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontFamily: 'Montserra'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Envoyer un nouveau code",
                      style: TextStyle(
                          fontSize: 18,
                          color: MaterialColor(0xffffb6af, color),
                          fontFamily: 'Montserra'),
                    )),
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
