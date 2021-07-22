import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'buildblur.dart';

class Qr extends StatefulWidget {
  const Qr({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {
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
                          alignment: Alignment.centerLeft,
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
                                Icons.arrow_back,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 1),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Qr code",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Montserra',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Spacer(flex: 1),
                        Expanded(
                          flex: 6,
                          child: buildBlur(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  child: Center(
                                    child: QrImage(
                                      data: 'Simon CHEREL',
                                      version: 1,
                                      size: MediaQuery.of(context).size.width *
                                          0.8,
                                      gapless: true,
                                      errorStateBuilder: (cxt, err) {
                                        return Container(
                                          child: Center(
                                            child: Text(
                                                "Oups, quelque chose ne s'est pas déroulé comme prévu ...",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: 'Montserra')),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 2)
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
