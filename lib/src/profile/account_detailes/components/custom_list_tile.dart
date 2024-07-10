import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../tabs/components/custom_botton_app_bar.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsTheme.listTileBackground,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderSize.smallRadius,
        child: ListTile(
          leading: Image.asset(
            imagePath,
            // Assuming the image size needs to be adjusted, you can specify width and height here
            width: 40,
            height: 40,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: FontsTheme.mediumSize,
              fontWeight: FontsTheme.mediumBigWeight,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              color: ColorsTheme.subtitle,
              fontWeight: FontsTheme.mediumBigWeight,
            ),
          ),
          trailing: const GradientIcon(icon: Icons.chevron_right),
        ),
      ),
    );
  }
}
