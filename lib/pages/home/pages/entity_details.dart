import 'package:c_royal/settings/style.dart';
import 'package:c_royal/widgets/custom_expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class EntityDetails extends StatefulWidget {
  const EntityDetails({Key key}) : super(key: key);

  @override
  _EntityDetailsState createState() => _EntityDetailsState();
}

class _EntityDetailsState extends State<EntityDetails> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: _size.height,
        width: _size.width,
        child: SafeArea(
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: _size.height * .4,
                    width: _size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/foo-chilly-chicken.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: _size.width,
                      height: 100.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withOpacity(.7),
                            primaryColor.withOpacity(.5),
                            primaryColor.withOpacity(.3),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40.0,
                              width: 60.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.0),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        "assets/svg/back-svgrepo-com.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10.0, 200.0, 10.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12.0,
                      color: Colors.grey.withOpacity(.2),
                      offset: const Offset(0, 10.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                width: _size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Restaurant Olive',
                            style: GoogleFonts.mulish(
                              color: primaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Restaurant & lounges',
                            style: GoogleFonts.mulish(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.1),
                                  offset: const Offset(0, 10.0),
                                  blurRadius: 10.0,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'à 5 km de votre position actuelle.',
                                    style: GoogleFonts.mulish(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: secondaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.1),
                                        offset: const Offset(0, 10.0),
                                        blurRadius: 10.0,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Shimmer.fromColors(
                                        enabled: true,
                                        baseColor: Colors.white,
                                        highlightColor: primaryColor,
                                        direction: ShimmerDirection.ttb,
                                        child: SvgPicture.asset(
                                          "assets/svg/location-svgrepo-com.svg",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: CustomExpandable(
                              title: "Points de vente",
                              child: Container(
                                height: 400.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 10.0,
                            ),
                            child: CustomExpandable(
                              title: "Remises",
                              hasExpanded: true,
                              child: Container(
                                height: 400.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        for (int i = 0; i < 6; i++) ...[
                                          const RemiseCard()
                                        ]
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RemiseCard extends StatelessWidget {
  const RemiseCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "15 % de remise sur l'addition",
                  style: GoogleFonts.mulish(
                    color: primaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Condition : 15 % de remise sur l'addition",
                  style: GoogleFonts.mulish(
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Tous les jours de 10H à 18H",
                  style: GoogleFonts.mulish(
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: 40.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 12.0,
                    offset: const Offset(0, 10.0),
                  )
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/next-right-arrow-svgrepo-com.svg",
                  color: secondaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
