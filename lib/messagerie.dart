import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

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
                    padding: EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              widget.pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Messagerie",
                            style: TextStyle(
                                fontSize: 20.0, fontFamily: 'Montserra'),
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

  Widget buildBlur({
    required Widget child,
    BorderRadius borderRadius = BorderRadius.zero,
    double sigmaX = 40,
    double sigmaY = 40,
  }) =>
      ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      );
}
