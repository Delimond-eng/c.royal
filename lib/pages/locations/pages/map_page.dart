import 'dart:async';

import 'package:c_royal/pages/locations/components/map_pin.dart';
import 'package:c_royal/pages/locations/models/pin_info.dart';
import 'package:c_royal/pages/locations/utils/utils.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 50;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(-71.167889, 15.2812905);
const LatLng DEST_LOCATION = LatLng(-4.313430, 15.275640);

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> mapController = Completer();
  Set<Marker> markers = {};
// for my drawn routes on the map
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  String googleAPIKey = 'AIzaSyB3zCnYsnKTsnN7uLJKWQ4SPWc0BZ50JkY';
// for my custom marker pins
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
// the user's initial location and current location
// as it moves
  LocationData currentLocation;
// a reference to the destination location
  LocationData destinationLocation;
// wrapper around the location API
  Location location;
  double pinPillPosition = -100;
  PinInfo currentlySelectedPin = PinInfo(
    pinPath: '',
    avatarPath: '',
    location: const LatLng(0, 0),
    locationName: '',
    labelColor: Colors.grey,
  );
  PinInfo sourcePinInfo;
  PinInfo destinationPinInfo;

  void setSourceAndDestinationIcons() async {
    setState(() {
      sourceIcon = BitmapDescriptor.defaultMarkerWithHue(200);
      destinationIcon = BitmapDescriptor.defaultMarkerWithHue(90);
    });
  }

  void setInitialLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();
    // hard-coded destination for this example
    destinationLocation =
        LocationData.fromMap({"latitude": -4.313430, "longitude": 15.275640});
  }

  @override
  void initState() {
    super.initState();
    // create an instance of Location
    location = Location();
    polylinePoints = PolylinePoints();
    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location.onLocationChanged.listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap();
    });
    // set custom marker pins
    setSourceAndDestinationIcons();
    // set the initial location
    setInitialLocation();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: SOURCE_LOCATION,
    );
    if (currentLocation != null) {
      initialCameraPosition = const CameraPosition(
        target: LatLng(-4.313430, 15.275640),
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    primaryColor,
                    secondaryColor,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 10.0,
                    offset: const Offset(0, 10.0),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 8.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    SvgPicture.asset(
                      "assets/svg/location-position-svgrepo-com.svg",
                      height: 20.0,
                      width: 20.0,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "Map Guide",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      myLocationEnabled: true,
                      compassEnabled: true,
                      tiltGesturesEnabled: false,
                      markers: Set<Marker>.of(markers),
                      polylines: Set<Polyline>.of(polylines),
                      mapType: MapType.normal,
                      initialCameraPosition: initialCameraPosition,
                      onTap: (LatLng loc) {
                        pinPillPosition = -100;
                      },
                      onMapCreated: (GoogleMapController controller) {
                        mapController.complete(controller);
                        // my map has completed being created;
                        // i'm ready to show the pins on the map
                        showPinsOnMap();
                      },
                    ),
                    MapPin(
                      pinPosition: pinPillPosition,
                      pinInfo: currentlySelectedPin,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPinsOnMap() {
    // get a LatLng for the source location
    // from the LocationData currentLocation object
    var pinPosition = LatLng(
      currentLocation.latitude,
      currentLocation.longitude,
    );
    // get a LatLng out of the LocationData object
    var destPosition = LatLng(
      destinationLocation.latitude,
      destinationLocation.longitude,
    );

    sourcePinInfo = PinInfo(
      locationName: "Start Location",
      location: SOURCE_LOCATION,
      pinPath: "assets/icons/destination_map_marker.png",
      avatarPath: "assets/images/dogs.jpg",
      labelColor: Colors.blueAccent,
    );

    destinationPinInfo = PinInfo(
      locationName: "End Location",
      location: DEST_LOCATION,
      pinPath: "assets/icons/destination_map_marker.png",
      avatarPath: "assets/images/dogs.jpg",
      labelColor: Colors.purple,
    );

    // add the initial source location pin
    setState(() {
      markers.add(
        Marker(
          markerId: const MarkerId('sourcePin'),
          position: pinPosition,
          onTap: () {
            setState(() {
              currentlySelectedPin = sourcePinInfo;
              pinPillPosition = 0;
            });
          },
          icon: sourceIcon,
        ),
      );
      // destination pin
      markers.add(
        Marker(
          markerId: const MarkerId('destPin'),
          position: destPosition,
          onTap: () {
            setState(() {
              currentlySelectedPin = destinationPinInfo;
              pinPillPosition = 0;
            });
          },
          icon: destinationIcon,
        ),
      );
    });
    // set the route lines on the map from source to destination
    // for more info follow this tutorial
    setPolylines();
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(currentLocation.latitude, currentLocation.longitude),
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      PolylineId id = PolylineId("poly");
      Polyline polyline = Polyline(
          polylineId: id, color: Colors.red, points: polylineCoordinates);
      setState(() {
        polylines.add(polyline);
      });
    }
  }

  void updatePinOnMap() async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
    );
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(cPosition),
    );
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      // updated position
      var pinPosition = LatLng(
        currentLocation.latitude,
        currentLocation.longitude,
      );
      sourcePinInfo.location = pinPosition;
      // the trick is to remove the marker (by id)
      // and add it again at the updated location
      markers.removeWhere((m) => m.markerId.value == 'sourcePin');
      markers.add(
        Marker(
          markerId: const MarkerId('sourcePin'),
          onTap: () {
            setState(() {
              currentlySelectedPin = sourcePinInfo;
              pinPillPosition = 0;
            });
          },
          position: pinPosition, // updated position
          icon: sourceIcon,
        ),
      );
    });
  }
}
