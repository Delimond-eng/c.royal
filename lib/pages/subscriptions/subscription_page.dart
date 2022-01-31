import 'dart:math';

import 'package:c_royal/components/app_header.dart';
import 'package:c_royal/components/notification_drawer.dart';
import 'package:c_royal/models/configs.dart';
import 'package:c_royal/services/api/api_manager.dart';
import 'package:c_royal/settings/controllers.dart';
import 'package:c_royal/settings/style.dart';
import 'package:c_royal/settings/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({Key key}) : super(key: key);

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int total = 0;
  List<String> sendsData = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    setState(() {
      total = 0;
    });
  }

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
                  title: "Abonnements",
                  onOpenNotificateDrawer: () =>
                      scaffoldKey.currentState.openEndDrawer(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "Profitez des meilleures remises en vous abonnant !",
                          style: GoogleFonts.lato(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SubscriptionBtn(
                        onPressed: () async {
                          Xloading.showLottieLoading(context);
                          await ApiManager.viewSubscriptions().then((res) {
                            Xloading.dismiss();
                            print(res.abonnement.abonnementId);
                          });
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          height: 60.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                primaryColor,
                                secondaryColor,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.calendar,
                                    color: Colors.white,
                                    size: 12.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Date d'expiration de votre abonnement",
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                "20th 2022",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: const [
                              Text("subscriptions"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
                //subscriptionBox(),
                /*if (sendsData.isNotEmpty) ...[
                  buildSubscriptionInfo(context),
                ],*/
              ],
            ),
          ),
        ),
      ),
      endDrawer: const NotificationDrawer(),
    );
  }

  Widget buildSubscriptionInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      color: Colors.white.withOpacity(.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sous total de la sélection',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w900,
                    color: secondaryColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '$total ',
                        style: GoogleFonts.bigShouldersStencilText(
                          color: Colors.black87,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.0,
                          fontSize: 25.0,
                        ),
                      ),
                      TextSpan(
                        text: 'FC',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w900,
                          color: primaryColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: Offset.zero,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.transparent,
              child: InkWell(
                onTap: () => subscribe(context),
                borderRadius: BorderRadius.circular(30.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Valider l'abonnement",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget subscriptionBox() {
    return Expanded(
      child: Container(
        child: Scrollbar(
            radius: const Radius.circular(10.0),
            thickness: 4,
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 8.0,
              ),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.9,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
              ),
              itemCount: homeController.categories.length,
              itemBuilder: (context, index) {
                var data = homeController.categories[index];
                if (data.abonnement != null) {
                  return SubscriptionCard(
                    data: data,
                    onSelected: () {
                      setState(() {
                        data.hasSelected = !data.hasSelected;
                      });

                      if (data.hasSelected) {
                        int subTot = total;
                        int currentTotal =
                            subTot + int.parse(data.abonnement.montant);
                        setState(() {
                          total = currentTotal;
                          sendsData.add(data.abonnement.abonnementTarifId);
                        });
                      } else {
                        int subTot = total;
                        int currentTot =
                            subTot - int.parse(data.abonnement.montant);
                        setState(() {
                          total = currentTot;
                          sendsData.removeWhere((String e) =>
                              e == data.abonnement.abonnementTarifId);
                        });
                      }
                      //
                    },
                  );
                }
                return const SizedBox();
              },
            )),
      ),
    );
  }

  Future<void> subscribe(context) async {
    String abonnementId = "";
    Xloading.showLottieLoading(context);
    for (var e in sendsData) {
      print(e);
      var res = await ApiManager.subscribe(
          subscribeAmountId: e, subscribeId: abonnementId);
      if (res != null) {
        if (res["reponse"]["status"] == "success") {
          abonnementId = res["reponse"]["abonnement_id"].toString();
        }
      }
    }
    Xloading.dismiss();
    XDialog.showSuccessAnimation(context);
    for (var selected in homeController.categories) {
      if (selected.hasSelected) {
        setState(() {
          selected.hasSelected = false;
          total = 0;
          sendsData.clear();
        });
      }
    }
  }
}

class SubscriptionBtn extends StatelessWidget {
  final Function onPressed;
  const SubscriptionBtn({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            secondaryColor,
            primaryColor,
          ],
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.person_circle_fill,
                  size: 16.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Mon abonnement",
                  style: GoogleFonts.lato(
                    color: Colors.white,
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

class SubscriptionCard extends StatelessWidget {
  final MarchandCategories data;
  final Function onSelected;
  const SubscriptionCard({
    Key key,
    this.data,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: data.hasSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: onSelected,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.network(
                        data.icon,
                        height: 20.0,
                        width: 20.0,
                        color: Colors
                            .primaries[
                                Random().nextInt(Colors.primaries.length)]
                            .shade900,
                      ),
                      Container(
                        height: 20.0,
                        width: 20.0,
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2,
                              color: data.hasSelected
                                  ? Colors.white
                                  : primaryColor),
                        ),
                        child: (data.hasSelected)
                            ? Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: data.hasSelected
                                        ? [
                                            Colors.white,
                                            Colors.blue[400],
                                          ]
                                        : [
                                            primaryColor,
                                            Colors.blue,
                                          ],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              )
                            : null,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    data.categorie,
                    style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Prix abonnement",
                    style: GoogleFonts.lato(
                      color:
                          data.hasSelected ? Colors.grey[50] : Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${data.abonnement.montant} ',
                          style: GoogleFonts.lato(
                            color: data.hasSelected
                                ? Colors.white
                                : Colors.black87,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(
                          text: data.abonnement.devise,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            color:
                                data.hasSelected ? Colors.white : primaryColor,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
