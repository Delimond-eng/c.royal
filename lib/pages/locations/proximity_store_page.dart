import 'package:c_royal/components/app_header.dart';
import 'package:c_royal/components/notification_drawer.dart';
import 'package:c_royal/models/category.dart';
import 'package:c_royal/widgets/category_card.dart';
import 'package:c_royal/widgets/store_card.widget.dart';
import 'package:flutter/material.dart';

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
              color: Colors.white.withOpacity(.5),
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
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(15.0),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: categories.map((e) {
                              return CategoryCard(
                                data: e,
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Scrollbar(
                              thickness: 3.0,
                              radius: const Radius.circular(5.0),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  children: [
                                    for (int i = 0; i < 10; i++) ...[
                                      const StoreCard(),
                                    ]
                                  ],
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
