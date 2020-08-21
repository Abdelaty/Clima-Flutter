import 'package:geolocator/geolocator.dart';

class LocationController {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;

      print('position is $position'
          'latitude is $latitude'
          'longitude is $longitude');
    } catch (e) {
      print(e);
    }
  }
}
