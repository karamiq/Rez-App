import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class DialogHead extends StatelessWidget {
  const DialogHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.filledTonal(
          onPressed: () => context.pop(),
          style: IconButton.styleFrom(
              foregroundColor: const Color(0xFF817B7B),
              backgroundColor: ColorsTheme.ticketingListTileBackground),
          icon: const Icon(
            Icons.arrow_back,
            size: IconSize.large,
          ),
        ),
        const Text(
          'Choose seats',
          style: TextStyle(
              color: Colors.white,
              fontSize: FontsTheme.mediumBigSize,
              fontWeight: FontsTheme.mediumBigWeight),
        ),
        const Icon(null),
      ],
    );
  }
}
