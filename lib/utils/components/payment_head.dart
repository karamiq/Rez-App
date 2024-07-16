import 'dart:ui';

import 'package:flutter/material.dart';

import '../../common_lib.dart';
import 'custom_app_bar.dart';

class OnlinePaymentHead extends StatelessWidget {
  final String title;
  final String imageUrl;

  const OnlinePaymentHead({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Opacity(
            opacity: .7,
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
        ),
        Padding(
          padding: Insets.mediumAll,
          child: SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: CustomAppBar(
                title: 'Payment',
                showCalender: true,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: FontsTheme.mediumVeryBigSize,
                fontWeight: FontsTheme.bigWeight,
                color: Colors.white),
          ),
        )
      ],
    );
  }
}
