import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'color_range.dart';
import 'logo.dart';
import 'otp.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class RegisterNum extends StatelessWidget {
  const RegisterNum({Key? key}) : super(key: key);

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
                  "Inscription",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontFamily: 'Comfortaa'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Ajoutez votre numéro de téléphone, nous allons vous envoyer un code de vérification.",
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
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Otp()));
                            },
                            child: Text(
                              "Envoyer",
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
