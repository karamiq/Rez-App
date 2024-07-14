import 'package:flutter/material.dart';

import '../../../../common_lib.dart';
import '../../../../utils/components/custom_app_bar.dart';

class BuyingHead1 extends StatelessWidget {
  const BuyingHead1({
    super.key,
    required this.appBarTitle,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
  });
  final String appBarTitle;
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
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
          Padding(
            padding: Insets.mediumAll,
            child: SafeArea(
              child: Align(
                alignment: Alignment.center,
                child: CustomAppBar(
                  title: 'Name',
                  showCalender: true,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: Insets.mediumAll,
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
                    subTitle,
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
