import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class EmptySelectedSeatsSnackBar {
  static void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          showCloseIcon: true,
          closeIconColor: Colors.red,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorsTheme.primary,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          padding: Insets.mediumAll,
          backgroundColor: ColorsTheme.backGround,
          content: Text(
            'Please select at least one seat.',
            style:
                TextStyle(color: Colors.white, fontSize: FontsTheme.mediumSize),
          )),
    );
  }
}
