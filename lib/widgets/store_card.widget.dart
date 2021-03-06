import 'package:c_royal/models/user_home_data.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreCard extends StatelessWidget {
  final PointDeVentes data;
  const StoreCard({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 120.0,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 80.0,
                width: 120.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/Beatrice-Hotel_6.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primaryColor,
                        secondaryColor,
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 12.0,
                        offset: const Offset(0, 5.0),
                      )
                    ],
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50.0),
                      onTap: () async {},
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/svg/location-position-svgrepo-com.svg",
                            color: Colors.white,
                            width: 20.0,
                            height: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
            child: Text(
              data.nom,
              style: GoogleFonts.mulish(
                color: primaryColor,
                fontSize: 12.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
            child: Text(
              "?? ${data.distance} de votre position",
              style: GoogleFonts.lato(
                color: Colors.redAccent,
                fontSize: 10.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
