// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import 'package:c_royal/settings/style.dart';
import 'package:c_royal/widgets/expanded_remise_card.dart';
import 'package:c_royal/widgets/store_card.widget.dart';
import 'package:flutter/cupertino.dart';
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
              detailsHead(_size, context),
              detailsWidget(_size),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsWidget(Size _size) {
    return Container(
      height: _size.height,
      margin: const EdgeInsets.fromLTRB(0.0, 230.0, 0.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: _size.width,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PartTitle(
                  icon: "assets/svg/delivery-svgrepo-com.svg",
                  title: "Remises",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: Column(
                      children: [
                        for (int i = 0; i < 6; i++) ...[
                          RemiseCard(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 15.0,
                              ),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0; i < 6; i++) ...[
                                    const StoreCard(),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -25.0,
            right: 10.0,
            left: 10.0,
            child: Container(
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 12.0,
                    offset: const Offset(0, 12.0),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'à 4 km de votre position actuelle',
                      style: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          primaryColor,
                          secondaryColor,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Shimmer.fromColors(
                              enabled: true,
                              direction: ShimmerDirection.ttb,
                              baseColor: Colors.white,
                              highlightColor: primaryColor,
                              child: SvgPicture.asset(
                                "assets/svg/location-position-svgrepo-com.svg",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget detailsHead(Size _size, BuildContext context) {
    return Stack(
      children: [
        Container(
          height: _size.height * .4,
          width: _size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/foo-chilly-chicken.jpg"),
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
            height: 110.0,
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
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Restaurant Olive',
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Restaurant & lounges',
                          style: GoogleFonts.mulish(
                            color: Colors.grey[100],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PartTitle extends StatelessWidget {
  final String icon, title;
  const PartTitle({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: const EdgeInsets.only(
        right: 20.0,
        bottom: 15.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 12.0,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.primaries[Random().nextInt(Colors.primaries.length)]
                        .shade900,
                    Colors.primaries[Random().nextInt(Colors.primaries.length)]
                        .shade900,
                  ],
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  height: 15.0,
                  width: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                fontSize: 18.0,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
