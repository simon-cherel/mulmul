import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'buildblur.dart';
import 'commerce.dart';
import 'vitrine.dart';

class Facade extends StatefulWidget {
  const Facade(
      {Key? key,
      required this.pageControllerH,
      required this.pageControllerV,
      required this.commerce})
      : super(key: key);
  final PageController pageControllerH;
  final PageController pageControllerV;
  final Commerce commerce;
  @override
  _FacadeState createState() => _FacadeState();
}

class _FacadeState extends State<Facade> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: buildBlur(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                color: AdaptiveTheme.of(context)
                    .theme
                    .accentColor
                    .withOpacity(0.95),
                child: SizedBox.expand(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      shape: BoxShape.circle,
                                      color: AdaptiveTheme.of(context)
                                          .theme
                                          .backgroundColor),
                                  child: Icon(Icons.storefront, size: 30),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.commerce.nom,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Montserra',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Evry, France",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'Montserra',
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      shape: BoxShape.circle,
                                      color: AdaptiveTheme.of(context)
                                          .theme
                                          .backgroundColor),
                                  child: IconButton(
                                    onPressed: () {
                                      widget.pageControllerH.animateToPage(0,
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
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 24,
                          child: Vitrine(commerce: widget.commerce),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                color: AdaptiveTheme.of(context)
                                    .theme
                                    .primaryColor),
                            child: IconButton(
                              onPressed: () {
                                widget.pageControllerV.animateToPage(1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              },
                              icon: Icon(
                                Icons.arrow_downward_rounded,
                                size: 30,
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
