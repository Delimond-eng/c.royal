import 'package:c_royal/settings/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RoyaumeDetailsPage extends StatefulWidget {
  const RoyaumeDetailsPage({Key key}) : super(key: key);

  @override
  State<RoyaumeDetailsPage> createState() => _RoyaumeDetailsPageState();
}

class _RoyaumeDetailsPageState extends State<RoyaumeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _header(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
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
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.0),
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              CupertinoIcons.clear,
                              color: light,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
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
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    colors: [
                      golden800,
                      golden900,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Bienvenue au Royaume ",
                        style: GoogleFonts.dancingScript(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.0,
                          color: primaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: " Beauté !",
                            style: GoogleFonts.dancingScript(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 210.0),
      decoration: BoxDecoration(
        color: light,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 15.0,
            ),
            height: 35.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child: Text(
              "Nos Top 10 de marchands",
              style: GoogleFonts.dancingScript(
                color: primaryColor,
                fontSize: 25.0,
                letterSpacing: 1,
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
                  Column(
                    children: [
                      Container(
                        height: 150.0,
                        width: 150.0,
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/shapes/features-bg.png"),
                          ),
                          borderRadius: BorderRadius.circular(200.0),
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
                            borderRadius: BorderRadius.circular(200.0),
                            color: Colors.blue.withOpacity(.5),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(),
                              Positioned(
                                top: 10.0,
                                right: 0,
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
                                        color: Colors.black.withOpacity(.3),
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
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Beatrice hôtel",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dancingScript(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Remise de 8% !",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dancingScript(
                                color: Colors.pink,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10.0,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abonnement !",
                          style: GoogleFonts.dancingScript(
                            color: primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 25.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Tarif : ",
                                    style: GoogleFonts.dancingScript(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 2.0,
                                      color: primaryColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " 1\$",
                                        style: GoogleFonts.dancingScript(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 2.0,
                                          color: golden900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Durée : ",
                                    style: GoogleFonts.dancingScript(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 2.0,
                                      color: primaryColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " 1 Semaine",
                                        style: GoogleFonts.dancingScript(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 2.0,
                                          color: golden900,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 40.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 10.0,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                              child: Material(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(30.0),
                                  onTap: () {},
                                  child: const Center(
                                    child: Icon(
                                      CupertinoIcons.checkmark_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
