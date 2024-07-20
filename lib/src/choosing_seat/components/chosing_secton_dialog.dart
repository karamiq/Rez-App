import 'package:flutter/material.dart';
import '../../../common_lib.dart';
import 'selecting_seat_dialog.dart';

Future<dynamic> choseSectionDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            insetPadding: Insets.mediumAll,
            child: Container(
              padding: Insets.extraLargeAll,
              decoration: const BoxDecoration(
                  borderRadius: BorderSize.mediumRadius,
                  color: ColorsTheme.backGround),
              child: InkWell(
                onTap: () => selectSeatDialog(context),
                child: Image.asset(Assets.assetsImagesStaduim),
              ),
            ),
          ));
}
