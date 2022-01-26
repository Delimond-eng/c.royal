import 'package:c_royal/pages/locations/models/pin_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          margin: const EdgeInsets.all(20),
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
                child: ClipOval(
                  child: Image.asset(pinInfo.avatarPath, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        pinInfo.locationName,
                        style: GoogleFonts.lato(color: pinInfo.labelColor),
                      ),
                      Text(
                        'Latitude: ${pinInfo.location.latitude.toString()}',
                        style:
                            GoogleFonts.lato(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'Longitude: ${pinInfo.location.longitude.toString()}',
                        style:
                            GoogleFonts.lato(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(pinInfo.pinPath, width: 50, height: 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}
