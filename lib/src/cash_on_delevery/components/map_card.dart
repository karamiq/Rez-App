import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../common_lib.dart';

class DrivenToLocation extends StatefulWidget {
  const DrivenToLocation({
    super.key,
    required this.selectedLocation,
  });

  final Function(LatLng?) selectedLocation;

  @override
  State<DrivenToLocation> createState() => _DrivenToLocationState();
}

class _DrivenToLocationState extends State<DrivenToLocation> {
  LatLng? location;
  GoogleMapController? mapController;
  String themeForMap = '';

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString(Assets.assetsThemesDarkMapTheme)
        .then((value) {
      themeForMap = value;
    });
    location = location ?? DefaultVars.defaultLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Location',
              style: TextStyle(
                fontWeight: FontsTheme.mediumBigWeight,
                fontSize: FontsTheme.mediumBigSize,
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
            ),
            InkWell(
              onTap: () async {
                var newLocation =
                    await context.pushNamed<LatLng>(RoutesDocument.reLocate);
                setState(() {
                  if (newLocation != null) {
                    location = newLocation;
                    widget.selectedLocation(location);
                    mapController?.animateCamera(
                      CameraUpdate.newLatLng(location!),
                    );
                  } else {
                    location = null;
                    widget.selectedLocation(null);
                  }
                });
              },
              borderRadius: BorderSize.smallRadius,
              child: Padding(
                padding: Insets.smallAll,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.assetsSvgLocationOutlined,
                      color: ColorsTheme.lightGreen,
                      height: 20,
                    ),
                    Text(
                      'Relocation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontsTheme.mediumBigWeight,
                        color: ColorsTheme.lightGreen,
                        fontSize: FontsTheme.mediumSize,
                        fontFamily: GoogleFonts.cairo().fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 230,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorsTheme.darkIndego,
          ),
          child: location != null
              ? ClipRRect(
                  borderRadius: BorderSize.smallRadius,
                  child: GoogleMap(
                    compassEnabled: false,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    scrollGesturesEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: location!,
                      zoom: 13.0,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('selectedLocation'),
                        position: location!,
                      ),
                    },
                    onMapCreated: (controller) {
                      mapController = controller;
                      mapController!.setMapStyle(themeForMap);
                    },
                  ),
                )
              : const Center(
                  child: Text(
                    'No location selected',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontsTheme.mediumSize,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
