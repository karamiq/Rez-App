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

  @override
  void initState() {
    super.initState();
    // Default location
    location = DefaultVars.defaultLocation;
    //Assuming later on i ask the user for his current location
    setState(() {});
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
        Opacity(
          opacity: .9,
          child: Container(
            height: 230,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorsTheme.darkIndego,
              borderRadius: BorderSize.smallRadius,
            ),
            child: Center(
              child: Text(
                location != null ? location.toString() : 'No location selected',
                style: const TextStyle(
                    color: Colors.white, fontSize: FontsTheme.mediumSize),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
