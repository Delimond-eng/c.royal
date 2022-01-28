import 'package:c_royal/models/user_home_data.dart';
import 'package:c_royal/pages/home/pages/entity_details.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ShopCard extends StatelessWidget {
  final Marchands data;
  final bool hasProximited;
  const ShopCard({
    Key key,
    this.data,
    this.hasProximited = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 12.0,
            offset: const Offset(0, 5),
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: EntityDetails(
                  data: data,
                ),
                type: PageTransitionType.rightToLeftWithFade,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (data.imageCover != null && data.imageCover.isNotEmpty) ...[
                  Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(data.imageCover),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  )
                ] else ...[
                  Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/Beatrice-Hotel_6.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  )
                ],
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          data.nom,
                          style: GoogleFonts.mulish(
                            color: primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          data.categorie,
                          style: GoogleFonts.lato(
                            color: Colors.grey[700],
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        if (hasProximited) ...[
                          Text(
                            "à ${data.distance} de votre position ",
                            style: GoogleFonts.lato(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                            ),
                          )
                        ] else ...[
                          if (data.offres.length <= 1) ...[
                            Text(
                              "Remise de ${data.offres.first.remise}% ",
                              style: GoogleFonts.lato(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                              ),
                            )
                          ] else ...[
                            Text(
                              "Remise de ${data.offres.first.remise}% à ${data.offres.last.remise}%",
                              style: GoogleFonts.lato(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
