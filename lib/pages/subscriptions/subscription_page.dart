import 'package:c_royal/components/app_header.dart';
import 'package:c_royal/components/notification_drawer.dart';
import 'package:c_royal/settings/style.dart';
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
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Mes abonnements",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Scrollbar(
                      radius: const Radius.circular(10.0),
                      thickness: 4,
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 3,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  offset: Offset.zero,
                                  color: Colors.grey.withOpacity(0.5),
                                )
                              ],
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svg/clothing.svg",
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                    Container(
                                      height: 25.0,
                                      width: 25.0,
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2, color: primaryColor),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              primaryColor,
                                              Colors.blue,
                                            ],
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Categorie",
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
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  "2500 FC",
                                  style: GoogleFonts.lato(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
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
                                    text: '25000 ',
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
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Valider l'abonnement",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
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
