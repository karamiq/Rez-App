import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  LatLng? position;
  double? latitude;
  double? longitude;
  Placemark? placemarks;
  LocationService(
      {required this.latitude,
      required this.longitude,
      required this.placemarks});
}
