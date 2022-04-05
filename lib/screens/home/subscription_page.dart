import 'package:c_royal/screens/home/royaume_detail_page.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
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
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        "assets/svg/back-svgrepo-com.svg",
                        color: light,
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    "Royaumes",
                    style: GoogleFonts.dancingScript(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/vectors/vector_1.png",
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 20.0,
                      width: 20.0,
                    ),
                    top: -10,
                    left: 2,
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

  Widget _body() {
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
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: [
                  golden900,
                  primaryColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bounjour cher Roi, chère Reine !",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dancingScript(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Veuillez sélectionner un royaume pour vous abonner et profitez de meilleurs reductions !",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dancingScript(
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                    color: light,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 40.0,
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 15.0,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child: Text(
              "Sélectionnez un royaume !",
              style: GoogleFonts.dancingScript(
                color: Colors.pink,
                fontSize: 25.0,
                letterSpacing: 1,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.4,
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 12,
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
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const RoyaumeDetailsPage(),
                              type: PageTransitionType.rightToLeftWithFade,
                              fullscreenDialog: true,
                            ),
                          );
                        },
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        style: GoogleFonts.dancingScript(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
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
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
