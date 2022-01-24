import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        border: Border.all(
          color: secondaryColor,
          width: .5,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 12.0,
            offset: const Offset(0, 10.0),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    "assets/images/Logo-CongoAirways-bizcongo-compagnieaerienne.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.1),
                  offset: const Offset(0, 10.0),
                  blurRadius: 12.0,
                )
              ],
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Congo Airways',
                    style: GoogleFonts.mulish(
                      color: primaryColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "15% de remise sur l'addition",
                    style: GoogleFonts.lato(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "valable jusqu'au 25 Février à 15:30",
                    style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
