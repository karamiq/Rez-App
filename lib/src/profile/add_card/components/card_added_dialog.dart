import 'package:flutter/material.dart';

import '../../../../common_lib.dart';
import '../../../../utils/components/buttons/gardient_border_button.dart';
import '../../../tabs/components/custom_botton_app_bar.dart';

Future<dynamic> CardAdded(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: Insets.mediumAll,
            child: Text(
              'Card added',
              style: TextStyle(
                  fontWeight: FontsTheme.bigWeight,
                  fontSize: FontsTheme.bigSize,
                  color: ColorsTheme.cyan),
            ),
          ),
          GradientIcon(
            icon: Icons.check_circle_outline,
            size: 280,
          ),
          const Gap(Insets.medium),
          GradientBorderButton(
              onPressed: () => context.pushNamed(RoutesDocument.tabs),
              text: 'Go back')
        ],
      ),
    ),
  );
}
