import 'package:c_royal/components/app_header.dart';
import 'package:c_royal/components/categries_component.dart';
import 'package:c_royal/components/notification_drawer.dart';
import 'package:c_royal/settings/controllers.dart';
import 'package:c_royal/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProximityStorePage extends StatefulWidget {
  const ProximityStorePage({Key key}) : super(key: key);

  @override
  State<ProximityStorePage> createState() => _ProximityStorePageState();
}

class _ProximityStorePageState extends State<ProximityStorePage> {
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
                  title: "Près de ma position",
                  onOpenNotificateDrawer: () =>
                      scaffoldKey.currentState.openEndDrawer(),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        CategoriesComponent(
                          data: homeController.categories,
                        ),
                        Expanded(
                          child: Container(
                            child: Scrollbar(
                              thickness: 3.0,
                              radius: const Radius.circular(5.0),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: homeController.marchands
                                      .map(
                                        (data) => ShopCard(
                                          hasProximited: true,
                                          data: data,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      endDrawer: const NotificationDrawer(),
    );
  }
}
