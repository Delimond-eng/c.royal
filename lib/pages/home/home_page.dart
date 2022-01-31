// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:c_royal/components/app_header.dart';
import 'package:c_royal/components/categries_component.dart';
import 'package:c_royal/components/notification_drawer.dart';
import 'package:c_royal/settings/controllers.dart';
import 'package:c_royal/settings/style.dart';
import 'package:c_royal/widgets/cat_shimmer.dart';
import 'package:c_royal/widgets/popular_card.dart';
import 'package:c_royal/widgets/post_card.dart';
import 'package:c_royal/widgets/shop_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

import 'pages/scanner_page.dart';

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
            child: Column(
              children: [
                AppHeader(
                  isHome: true,
                  onOpenNotificateDrawer: () {
                    scaffoldKey.currentState.openEndDrawer();
                  },
                ),
                Obx(
                  () => costumBody(_size),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        elevation: 10.0,
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: const ScannerPage(),
            ),
          );
        },
        child:
            const Icon(CupertinoIcons.qrcode_viewfinder, color: Colors.white),
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
            if (homeController.isHomeLoading.value) ...[
              const CategoryShimmer(),
            ] else ...[
              CategoriesComponent(
                data: homeController.categories,
              ),
            ],
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (homeController.isHomeLoading.value) ...[
                        const TitleShimmer(),
                        const RecommandationShimmer(),
                        const TitleShimmer(),
                        const PopularShimmer(),
                      ] else ...[
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
                                  .map(
                                    (e) => PostNewCard(
                                      data: e,
                                    ),
                                  )
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
                                  .map(
                                    (e) => PopularCard(
                                      data: e,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                        if (homeController.marchands.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Nos marchands",
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
                        ],
                      ],
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PopularShimmer extends StatelessWidget {
  const PopularShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      direction: ShimmerDirection.ltr,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15.0),
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            for (int i = 0; i < 3; i++) ...[
              Container(
                height: 180.0,
                width: 150.0,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class RecommandationShimmer extends StatelessWidget {
  const RecommandationShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      direction: ShimmerDirection.ltr,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15.0),
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            for (int i = 0; i < 2; i++) ...[
              Container(
                height: 120.0,
                width: 300.0,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class TitleShimmer extends StatelessWidget {
  const TitleShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      direction: ShimmerDirection.ltr,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        height: 20.0,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
