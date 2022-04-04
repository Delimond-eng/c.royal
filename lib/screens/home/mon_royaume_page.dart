import 'package:c_royal/settings/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MonRoyaumePage extends StatefulWidget {
  const MonRoyaumePage({Key key}) : super(key: key);

  @override
  State<MonRoyaumePage> createState() => _MonRoyaumePageState();
}

class _MonRoyaumePageState extends State<MonRoyaumePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [_header(), _body(context)],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/shapes/features-bg.png"),
        ),
        gradient: LinearGradient(
          colors: [primaryColor, golden900],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(.7),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/svg/menu.svg",
                color: light,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    "Mon Royaume",
                    style: GoogleFonts.dancingScript(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/vectors/vector_2.png",
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 20.0,
                      width: 20.0,
                    ),
                    top: -10,
                    left: 7,
                  )
                ],
              ),
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      golden800,
                      golden900,
                    ],
                  ),
                ),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.person,
                    color: Colors.white,
                    size: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 70.0),
      decoration: BoxDecoration(
        color: light,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 50.0,
                    margin: const EdgeInsets.fromLTRB(15.0, 17.0, 15.0, 0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 6, 6, 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Catégories souscrites",
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            height: 40.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  blurRadius: 10.0,
                                  offset: const Offset(0, 3),
                                )
                              ],
                              color: Colors.blue,
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(40.0),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(40.0),
                                onTap: () {},
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.grey[200],
                                    size: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.4,
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/shapes/shape_10.png"),
                            alignment: Alignment.bottomCenter,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              golden900,
                              golden800,
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            gradient: LinearGradient(
                              colors: [
                                golden900.withOpacity(.8),
                                golden800.withOpacity(.8),
                              ],
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svg/beauty.svg",
                                          color: Colors.white,
                                          height: 30.0,
                                          width: 30.0,
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "Beauté",
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                top: -5,
                                right: 5.0,
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [primaryColor, golden900],
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/vectors/vector_1.png",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                      height: 25.0,
                                      width: 25.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    height: 35.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    child: Text(
                      "Les plus populaires",
                      style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 18.0,
                        letterSpacing: .5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 15.0,
                    ),
                    child: Row(
                      children: [
                        for (int i = 0; i < 5; i++) ...[
                          Container(
                            height: 120.0,
                            width: 200.0,
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/shapes/features-bg.png"),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.1),
                                  offset: const Offset(0, 3),
                                  blurRadius: 10.0,
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  primaryColor,
                                  golden900,
                                ],
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.blue.withOpacity(.5),
                              ),
                              child: Material(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8.0),
                                  onTap: () async {},
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Beatrice hôtel",
                                                    style: GoogleFonts.lato(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    "Remise de 8% pour tout achat !",
                                                    style: GoogleFonts.lato(
                                                      color: golden100,
                                                      letterSpacing: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 8.0,
                                        right: 8.0,
                                        child: Container(
                                          height: 50.0,
                                          width: 50.0,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/Logo-BeatriceHotel-bizcongo-hotel.jpg"),
                                              fit: BoxFit.cover,
                                              alignment: Alignment.center,
                                            ),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.1),
                                                blurRadius: 12.0,
                                                offset: const Offset(0, 10),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    height: 35.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    child: Text(
                      "Nos Marchand",
                      style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 18.0,
                        letterSpacing: .5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .85,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/shapes/features-bg.png"),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.2),
                              offset: const Offset(0, 3),
                              blurRadius: 10.0,
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [
                              primaryColor,
                              Colors.white,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: light.withOpacity(.6),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8.0),
                              onTap: () async {},
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Beatrice hôtel",
                                                style: GoogleFonts.lato(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                "Remise de 8% pour tout achat !",
                                                style: GoogleFonts.lato(
                                                  color: Colors.pink,
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                      height: 100.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/shapes/features-bg.png"),
                                        ),
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(8.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.1),
                                            offset: const Offset(0, 3),
                                            blurRadius: 10.0,
                                          )
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            primaryColor,
                                            golden900,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8.0,
                                    right: 8.0,
                                    child: Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Logo-BeatriceHotel-bizcongo-hotel.jpg"),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.1),
                                            blurRadius: 12.0,
                                            offset: const Offset(0, 10),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
