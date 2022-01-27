import 'package:c_royal/models/user_home_data.dart';
import 'package:c_royal/pages/home/pages/entity_details.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class PopularCard extends StatelessWidget {
  final Populaires data;
  const PopularCard({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 150.0,
      margin: const EdgeInsets.only(right: 10.0),
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
          child: Column(
            children: [
              Stack(
                children: [
                  if (data.imageCover != null &&
                      data.imageCover.isNotEmpty) ...[
                    Container(
                      height: 100.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data.imageCover),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ] else ...[
                    Container(
                      height: 100.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image:
                              AssetImage("assets/images/Beatrice-Hotel_6.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                  if (data.logo != null && data.logo.isNotEmpty) ...[
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data.logo),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 12.0,
                              offset: const Offset(0, 10),
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.nom,
                        style: GoogleFonts.lato(
                          color: primaryColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        data.categorie,
                        style: GoogleFonts.lato(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "${data.offres.first.remise}% de remise sur l'addition",
                        style: GoogleFonts.lato(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
