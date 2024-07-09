import 'package:flutter/material.dart';

import '../../../../common_lib.dart';
import '../../../../utils/components/custom_app_bar.dart';

class DetailesUpperHalf extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;

  const DetailesUpperHalf({
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
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            )),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
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
          bottom: 0,
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
