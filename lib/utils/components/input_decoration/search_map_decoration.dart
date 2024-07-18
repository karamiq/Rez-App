import 'package:flutter/material.dart';

import '../../../common_lib.dart';

InputDecoration searchMapDecoration() {
  return InputDecoration(
    fillColor: const Color(0x4DD67DFF),
    hintText: 'Search',
    hintStyle: const TextStyle(
      color: Colors.white,
    ),
    prefixIcon: Padding(
      padding: Insets.smallAll,
      child:
          SvgPicture.asset(color: Colors.white, Assets.assetsSvgSearchNormal),
    ),
    border: const OutlineInputBorder(borderRadius: BorderSize.smallRadius),
  );
}
