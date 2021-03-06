import 'package:c_royal/models/user_home_data.dart';
import 'package:c_royal/pages/home/pages/entity_details.dart';
import 'package:c_royal/services/api/api_manager.dart';
import 'package:c_royal/settings/utilities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class PostNewCard extends StatelessWidget {
  final Recommandations data;
  const PostNewCard({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 300.0,
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
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () async {
            Xloading.showLottieLoading(context);
            var galleriesData =
                await ApiManager.viewGalleries(marchandId: data.marchandId);
            if (galleriesData != null) {
              Xloading.dismiss();
              Navigator.push(
                context,
                PageTransition(
                  child: EntityDetails(
                    data: data,
                    galleries: galleriesData.reponse.galleries,
                  ),
                  type: PageTransitionType.rightToLeftWithFade,
                ),
              );
            }
          },
          child: Row(
            children: [
              Stack(
                children: [
                  if (data.imageCover != null &&
                      data.imageCover.isNotEmpty) ...[
                    Container(
                      height: 120.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data.imageCover),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )
                  ] else ...[
                    Container(
                      height: 120.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image:
                              AssetImage("assets/images/Beatrice-Hotel_6.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )
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
                    )
                  ]
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.nom,
                        style: GoogleFonts.lato(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        data.categorie,
                        style: GoogleFonts.lato(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
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
                          "Remise de ${data.offres.first.remise}% ?? ${data.offres.last.remise}%",
                          style: GoogleFonts.lato(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                          ),
                        )
                      ],
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
