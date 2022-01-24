import 'package:c_royal/settings/style.dart';
import 'package:c_royal/widgets/custom_expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class EntityDetails extends StatefulWidget {
  const EntityDetails({Key key}) : super(key: key);

  @override
  _EntityDetailsState createState() => _EntityDetailsState();
}

class _EntityDetailsState extends State<EntityDetails> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    List<Widget> steps = [
      Container(
        child: const Center(
          child: Text("First step"),
        ),
      ),
      Container(
        child: const Center(
          child: Text("Second step"),
        ),
      ),
    ];
    return Scaffold(
      body: Container(
        height: _size.height,
        width: _size.width,
        child: SafeArea(
          child: Stack(
            children: [
              detailsHead(_size, context),
              detailsWidget(_size),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsWidget(Size _size) {
    return Container(
      height: _size.height,
      margin: const EdgeInsets.fromLTRB(0.0, 230.0, 0.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
      ),
      width: _size.width,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CustomExpandable(
                          title: "Points de vente",
                          icon: "assets/svg/store-svgrepo-com.svg",
                          child: Container(
                            height: 400.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 10.0,
                        ),
                        child: CustomExpandable(
                          icon: "assets/svg/delivery-svgrepo-com.svg",
                          title: "Remises",
                          hasExpanded: true,
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                children: [
                                  for (int i = 0; i < 6; i++) ...[
                                    const RemiseCard()
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -25.0,
            right: 10.0,
            left: 10.0,
            child: Container(
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 12.0,
                    offset: const Offset(0, 12.0),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'à 4 km de votre position actuelle',
                      style: GoogleFonts.mulish(
                        color: secondaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
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
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Shimmer.fromColors(
                              enabled: true,
                              direction: ShimmerDirection.ttb,
                              baseColor: Colors.white,
                              highlightColor: primaryColor,
                              child: SvgPicture.asset(
                                "assets/svg/location-position-svgrepo-com.svg",
                                color: Colors.white,
                              ),
                            ),
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
    );
  }

  Widget detailsHead(Size _size, BuildContext context) {
    return Stack(
      children: [
        Container(
          height: _size.height * .4,
          width: _size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/foo-chilly-chicken.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            width: _size.width,
            height: 110.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(.7),
                  primaryColor.withOpacity(.5),
                  primaryColor.withOpacity(.3),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40.0,
                    width: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/svg/back-svgrepo-com.svg",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Restaurant Olive',
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Restaurant & lounges',
                          style: GoogleFonts.mulish(
                            color: Colors.grey[100],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class RemiseCard extends StatelessWidget {
  const RemiseCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor.withAlpha(50),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "15 % de remise sur l'addition",
                    style: GoogleFonts.mulish(
                      color: primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Tous les jours de 10H à 18H",
                    style: GoogleFonts.mulish(
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(7.0),
              height: 30.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 12.0,
                    offset: const Offset(0, 10.0),
                  )
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/next-right-arrow-svgrepo-com.svg",
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
