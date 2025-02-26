import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common_lib.dart';

class RelocationPage extends ConsumerStatefulWidget {
  const RelocationPage({super.key});

  @override
  ConsumerState<RelocationPage> createState() => _PickYourLocationState();
}

class _PickYourLocationState extends ConsumerState<RelocationPage> {
  late GoogleMapController mapController;
  String themeForMap = '';
  Set<Marker> markers = {};
  bool locationSelected = false;
  bool isPlaceValid = true;
  bool isLoading = false;
  LatLng? position;

  @override
  void initState() {
    super.initState();
    _loadMapTheme();
  }

  Future<void> _loadMapTheme() async {
    themeForMap =
        await DefaultAssetBundle.of(context).loadString(Assets.assetsThemesDarkMapTheme);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> selectLocation(LatLng pos) async {
    setState(() {
      isPlaceValid = true;
      position = pos;
    });
  }

/*
    try {
      Placemark placemark = await convertToAddress(pos.latitude, pos.longitude);
      setState(() {
        locationService = LocationService(
          latitude: pos.latitude,
          longitude: pos.longitude,
          placemarks: placemark,
        );
        isPlaceValid = true;
      });
    } catch (e) {
      setState(() {
        isPlaceValid = false;
        locationService = null;
      });
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    // final userLocation = ref.watch(locationProvider);
    //LatLng cameraPosition = defaultLocation;

    // if (userLocation?.latitude != null && userLocation?.longitude != null) {
    //   cameraPosition = LatLng(userLocation!.latitude!, userLocation.longitude!);
    // }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select your place'),
        leading: const Padding(
          padding: Insets.mediumAll,
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition:
                const CameraPosition(target: DefaultVars.defaultLocation, zoom: 10),
            onMapCreated: (controller) {
              mapController = controller;
              mapController.setMapStyle(themeForMap);
            },
            onTap: (pos) {
              setState(() {
                locationSelected = true;
                markers.clear();
                markers.add(Marker(markerId: const MarkerId('m1'), position: pos));
              });
              selectLocation(pos);
            },
            markers: markers,
          ),
          if (isLoading) const Center(child: CircularProgressIndicator()),
          Positioned(
            bottom: 30.0,
            left: 95.0,
            right: 95.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientBorderButton(
                onPressed: locationSelected && isPlaceValid && !isLoading
                    ? () {
                        context.pop<LatLng>(position);
                      }
                    : null,
                text: 'pickLocation',
              ),
            ),
          ),
          if (!isPlaceValid)
            Positioned(
              top: 30.0,
              left: 95.0,
              right: 95.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  padding: Insets.mediumAll,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(131, 186, 26, 26),
                  ),
                  child: const Text(
                    'choseValidLocation',
                    style: TextStyle(
                      fontWeight: FontsTheme.bigWeight,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
