import 'dart:math';

import 'package:c_royal/models/category.dart';
import 'package:c_royal/models/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final Category data;
  final MarchandCategories category;
  const CategoryCard({
    Key key,
    this.data,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      height: 100.0,
      width: 80.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors
                .primaries[Random().nextInt(Colors.primaries.length)].shade900,
            Colors
                .primaries[Random().nextInt(Colors.primaries.length)].shade900,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            offset: Offset.zero,
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: () async {
            /*await ApiManager.login(
              data: {"telephone": "+243813719944", "otp": "258125"},
            ).then((res) {
              if (res != null) {
                print(res["reponse"]);
              }
            });*/
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.grey[100],
                      ],
                    ),
                  ),
                  child: SvgPicture.network(
                    category.icon,
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)]
                        .shade900,
                    height: 25.0,
                    width: 25.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Flexible(
                  child: Text(
                    category.categorie,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 12.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
