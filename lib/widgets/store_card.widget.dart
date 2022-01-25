import 'package:c_royal/services/api/api_manager.dart';
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
      height: 150.0,
      width: 140.0,
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
                width: 140.0,
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
                      onTap: () async {
                        await ApiManager.getHomeData().then((e) {
                          print(e.content.marchands[0].nom);
                        });
                      },
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
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
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
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.redAccent,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
