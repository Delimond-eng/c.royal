// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:c_royal/components/app_header.dart';
import 'package:c_royal/components/categries_component.dart';
import 'package:c_royal/components/notification_drawer.dart';
import 'package:c_royal/settings/controllers.dart';
import 'package:c_royal/widgets/popular_card.dart';
import 'package:c_royal/widgets/post_card.dart';
import 'package:c_royal/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          height: _size.height,
          width: _size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.8),
            ),
            child: Obx(
              () => (homeController.isHomeLoading.value)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        AppHeader(
                          isHome: true,
                          onOpenNotificateDrawer: () {
                            scaffoldKey.currentState.openEndDrawer();
                          },
                        ),
                        costumBody(_size),
                      ],
                    ),
            ),
          ),
        ),
      ),
      endDrawer: const NotificationDrawer(),
    );
  }

  Widget costumBody(Size _size) {
    return Expanded(
      child: Container(
        width: _size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoriesComponent(
                data: homeController.categories,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (homeController.recommandations.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Recommandations",
                              style: GoogleFonts.lato(
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              bottom: 18.0,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: homeController.recommandations
                                  .map((e) => PostNewCard(
                                        data: e,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                        if (homeController.populaires.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Les plus populaires",
                              style: GoogleFonts.lato(
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              bottom: 18.0,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: homeController.populaires
                                  .map((e) => PopularCard(
                                        data: e,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                        if (homeController.marchands.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Tous les points de vente",
                              style: GoogleFonts.lato(
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          for (var data in homeController.marchands) ...[
                            ShopCard(
                              data: data,
                            ),
                          ]
                        ]
                      ],
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
