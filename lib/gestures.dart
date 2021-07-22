import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class GestureBar extends StatefulWidget {
  const GestureBar({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  _GestureBarState createState() => _GestureBarState();
}

class _GestureBarState extends State<GestureBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AdaptiveTheme.of(context).theme.primaryColor,
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                        color: AdaptiveTheme.of(context).theme.accentColor),
                    child: IconButton(
                      onPressed: () {
                        widget.pageController.animateToPage(0,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      icon: Icon(
                        Icons.messenger_outline_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, fontFamily: 'Montserra'),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search_rounded),
                        hintText: 'Boulangerie, épicerie ...',
                        hintStyle:
                            TextStyle(fontSize: 20.0, fontFamily: 'Montserra'),
                        hintMaxLines: 1,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            borderSide: BorderSide(
                                width: 3,
                                color: AdaptiveTheme.of(context)
                                    .theme
                                    .primaryColor)),
                        fillColor: AdaptiveTheme.of(context).theme.accentColor,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AdaptiveTheme.of(context).theme.primaryColor,
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                        color: AdaptiveTheme.of(context).theme.accentColor),
                    child: IconButton(
                      onPressed: () {
                        widget.pageController.animateToPage(2,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      icon: Icon(
                        Icons.qr_code_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: Container(),
        ),
      ],
    );
  }
}
