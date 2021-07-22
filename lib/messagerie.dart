import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'buildblur.dart';

class Messagerie extends StatefulWidget {
  const Messagerie({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  _MessagerieState createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
      child: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 7,
            child: buildBlur(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                color: AdaptiveTheme.of(context)
                    .theme
                    .accentColor
                    .withOpacity(0.70),
                child: SizedBox.expand(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AdaptiveTheme.of(context)
                                      .theme
                                      .primaryColor,
                                  width: 3,
                                ),
                                shape: BoxShape.circle,
                                color: AdaptiveTheme.of(context)
                                    .theme
                                    .accentColor),
                            child: IconButton(
                              onPressed: () {
                                widget.pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Messagerie",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Montserra',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: buildBlur(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              color: AdaptiveTheme.of(context)
                                  .theme
                                  .primaryColor
                                  .withOpacity(0.70),
                              child: Padding(
                                padding: EdgeInsets.all(14),
                                child: ListView(
                                  children: [
                                    Text(
                                      "Vous n'avez aucun message",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'Montserra'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
