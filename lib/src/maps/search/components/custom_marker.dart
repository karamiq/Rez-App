import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.assetsSvgMusicMapPin,
      height: 100,
    );
  }
}
