import 'package:c_royal/settings/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 12.0,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80.0,
            width: 150.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/foo-chilly-chicken.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              "Kin mart Bandal.",
              style: GoogleFonts.mulish(
                color: primaryColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              "à 2km de votre position actuelle",
              style: GoogleFonts.lato(
                color: Colors.redAccent,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.only(bottom: 5),
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    Colors.blue,
                  ],
                ),
                shape: BoxShape.circle,
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
                  "assets/svg/location-position-svgrepo-com.svg",
                  color: Colors.white,
                  width: 20.0,
                  height: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
