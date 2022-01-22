import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivilegeCard extends StatelessWidget {
  const PrivilegeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            blurRadius: 12.0,
            offset: const Offset(0, 10.0),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 100.0,
            width: 120.0,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/olive_resto.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Restaurant\n",
                          style: GoogleFonts.lato(
                            color: Colors.black87,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: 'Chaned Tacos',
                          style: GoogleFonts.mulish(
                            color: primaryColor,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Restaurant & lounges barres",
                    style: GoogleFonts.lato(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "15% de remise sur l'addition",
                    style: GoogleFonts.lato(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 11.0,
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
