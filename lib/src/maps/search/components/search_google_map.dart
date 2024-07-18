import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../common_lib.dart';
import '../../../../data/providers/location.dart';

class CustomGoogleMap extends ConsumerStatefulWidget {
  final Map<String, Marker> markers;
  final Function(GoogleMapController) mapControllerCreate;

  const CustomGoogleMap({
    super.key,
    required this.markers,
    required this.mapControllerCreate,
  });

  @override
  ConsumerState<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends ConsumerState<CustomGoogleMap> {
  get currentLocation => ref.watch(locationProvider);
  static late GoogleMapController mapController;
  String themeForMap = '';

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString(Assets.assetsThemesDarkMapTheme)
        .then((value) {
      themeForMap = value;
    });
  }

  @override
  void didChangeDependencies() {
    ref.watch(locationProvider.notifier).getCurrentLocation();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    LatLng pos;
    if (currentLocation == null) {
      pos = DefaultVars.defaultLocation;
    } else {
      pos = LatLng(currentLocation?.latitude, currentLocation?.longitude);
    }
    return GoogleMap(
      myLocationButtonEnabled: false,
      markers: widget.markers.values.toSet(),
      zoomControlsEnabled: false,
      onTap: (pos) => print('Taped pos: $pos'),
      onMapCreated: (controller) {
        mapController = controller;
        mapController.setMapStyle(themeForMap);
        widget.mapControllerCreate(controller);
      },
      initialCameraPosition: CameraPosition(
        zoom: 11,
        target: pos,
      ),
    );
  }
}
