import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../utils/components/custom_app_bar.dart';

class DetailesUpperHalf2nd extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;

  const DetailesUpperHalf2nd({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          width: double.infinity,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Text(
                  'Image failed to load',
                  style: TextStyle(color: Colors.red),
                ),
              );
            },
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: Insets.mediumAll,
              child: CustomAppBar(title: 'Choose seats'),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontsTheme.bigWeight,
                  fontSize: FontsTheme.mediumVeryBigSize,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontWeight: FontsTheme.bigWeight,
                  fontSize: FontsTheme.mediumSize,
                ),
              ),
              const Gap(Insets.medium),
              Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 8,
                style: const TextStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
