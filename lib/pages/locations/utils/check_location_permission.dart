import 'package:location/location.dart';

Future<bool> checkPermissionLocation() async {
  Location location = Location();

  PermissionStatus _permissionGranted;

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return false;
    } else {
      return true;
    }
  } else {
    return true;
  }
}
