import 'package:app/utils/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/constants/assets.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  late GoogleMapController mapController;
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
                mapController.setMapStyle(themeForMap);
              },
              initialCameraPosition:
                  const CameraPosition(target: LatLng(30, 40))),
          SafeArea(
            child: Positioned(
                child: CustomAppBar(
              title: 'back',
            )),
          )
        ],
      ),
    );
  }
}
