import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'commerce.dart';
import 'buildblur.dart';

class Vitrine extends StatefulWidget {
  const Vitrine({Key? key, required this.commerce}) : super(key: key);
  final Commerce commerce;
  @override
  _VitrineState createState() => _VitrineState();
}

class _VitrineState extends State<Vitrine> {
  int pageIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  Expanded buildNavBarItem(
      PageController pageController, int page, IconData icon) {
    return Expanded(
      child: buildBlur(
        child: Container(
          decoration: (page == pageIndex)
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 3,
                      color: AdaptiveTheme.of(context).theme.primaryColor,
                    ),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      AdaptiveTheme.of(context)
                          .theme
                          .primaryColor
                          .withOpacity(0.30),
                      AdaptiveTheme.of(context)
                          .theme
                          .primaryColor
                          .withOpacity(0.015)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  color: (page == pageIndex)
                      ? AdaptiveTheme.of(context)
                          .theme
                          .primaryColor
                          .withOpacity(0.70)
                      : AdaptiveTheme.of(context)
                          .theme
                          .accentColor
                          .withOpacity(0.70),
                )
              : BoxDecoration(
                  color: AdaptiveTheme.of(context)
                      .theme
                      .accentColor
                      .withOpacity(0.70),
                ),
          child: IconButton(
            onPressed: () {
              setState(() {
                pageIndex = page;
              });
              pageController.animateToPage(page,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            },
            icon: Icon(icon),
          ),
        ),
        borderRadius: (page == 0)
            ? BorderRadius.only(bottomLeft: Radius.circular(24))
            : (page == 1)
                ? BorderRadius.zero
                : BorderRadius.only(bottomRight: Radius.circular(24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Expanded(
            flex: 22,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AdaptiveTheme.of(context).theme.accentColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24), bottom: Radius.zero),
              ),
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Doormate(commerce: widget.commerce),
                  Flux(commerce: widget.commerce),
                  Community(commerce: widget.commerce)
                ],
                controller: pageController,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  buildNavBarItem(pageController, 0, Icons.storefront),
                  buildNavBarItem(
                      pageController, 1, Icons.attach_money_rounded),
                  buildNavBarItem(pageController, 2, Icons.groups_rounded),
                ],
              ))
        ],
      ),
    );
  }
}

class Doormate extends StatelessWidget {
  const Doormate({Key? key, required this.commerce}) : super(key: key);
  final Commerce commerce;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: AspectRatio(
            aspectRatio: 255 / 408,
            child: Image.asset(
              './assets/boucherie.png',
            ),
          ),
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: Text(
            'Batnae municipium in Anthemusia conditum Macedonum manu priscorum ab Euphrate flumine.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Montserra',
            ),
          ),
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: Text(
            'Produits incontournables : ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Montserra',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [Produit(commerce: commerce)],
          ),
        )
      ],
    );
  }
}

class Produit extends StatelessWidget {
  const Produit({Key? key, required this.commerce}) : super(key: key);
  final Commerce commerce;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AdaptiveTheme.of(context).theme.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Column(
          children: [
            Spacer(flex: 2),
            Expanded(
              flex: 1,
              child: Text(
                "Viande Hachée",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Montserra',
                    fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "2.40€/kg",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Montserra',
                ),
              ),
            ),
          ],
        ));
  }
}

class Flux extends StatelessWidget {
  const Flux({Key? key, required this.commerce}) : super(key: key);
  final Commerce commerce;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 1),
        Expanded(
            flex: 1,
            child: Text(
              'Actualité',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Montserra',
              ),
            )),
        Expanded(
          flex: 4,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AdaptiveTheme.of(context).theme.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Text(
                  'Nouvel arrivage frais très bientôt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Montserra',
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Réductions ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Montserra',
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AdaptiveTheme.of(context).theme.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Text(
                  '-15% pour tout les clients mulmul',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Montserra',
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Community extends StatelessWidget {
  const Community({Key? key, required this.commerce}) : super(key: key);
  final Commerce commerce;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 2),
        Expanded(
          flex: 14,
          child: Padding(
            padding: EdgeInsets.all(14),
            child: ListView(
              children: [
                Text(
                  "Aucun commentaire n'a été posté",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, fontFamily: 'Montserra'),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintStyle:
                  TextStyle(color: Colors.black, fontFamily: 'Montserra'),
              hintText: "Un avis sur ce commerçant ?",
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
        ),
      ],
    );
  }
}
