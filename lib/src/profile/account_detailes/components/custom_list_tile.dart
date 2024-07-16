import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../tabs/components/custom_botton_app_bar.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onTap;

  const ProfileListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsTheme.profileListTileBackground,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderSize.smallRadius,
        child: ListTile(
          leading: Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: ColorsTheme.cyan,
              fontSize: FontsTheme.mediumSize,
              fontWeight: FontsTheme.mediumBigWeight,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              color: ColorsTheme.indego,
              fontWeight: FontsTheme.mediumBigWeight,
            ),
          ),
          trailing: GradientIcon(
            icon: Icons.chevron_right,
            size: IconSize.large,
          ),
        ),
      ),
    );
  }
}
