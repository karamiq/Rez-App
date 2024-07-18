import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    super.key,
    required this.location,
  });
  final LatLng location;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.assetsSvgMusicMapPin,
      height: 50,
    );
  }
}
