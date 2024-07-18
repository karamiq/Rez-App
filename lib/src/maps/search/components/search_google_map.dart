import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatelessWidget {
  final Map<String, Marker> markers;
  final String themeForMap;
  final Function(GoogleMapController) mapControllerCallback;
  final LatLng initialPosition;

  const CustomGoogleMap({
    super.key,
    required this.markers,
    required this.themeForMap,
    required this.mapControllerCallback,
    required this.initialPosition,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      markers: markers.values.toSet(),
      zoomControlsEnabled: false,
      onTap: (pos) => print('Taped pos: $pos'),
      onMapCreated: (controller) {
        mapControllerCallback(controller);
      },
      initialCameraPosition: CameraPosition(
        zoom: 13,
        target: initialPosition,
      ),
    );
  }
}
