import 'package:c_royal/pages/locations/models/pin_info.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class MapPin extends StatelessWidget {
  final PinInfo pinInfo;
  final double pinPosition;
  const MapPin({Key key, this.pinInfo, this.pinPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: pinPosition,
      right: 0,
      left: 0,
      duration: const Duration(milliseconds: 200),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.fromLTRB(8.0, 0.0, 5.0, 8.0),
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                offset: Offset.zero,
                color: Colors.grey.withOpacity(0.5),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
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
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ma position actuelle",
                        style: GoogleFonts.lato(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Veuillez atteindre la destination du point de vente",
                        style: GoogleFonts.lato(
                          color: Colors.blue,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
