import 'dart:ui';

import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;
  final Widget body;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
              right: -40,
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF311030),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 20,
              left: -20,
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0b1443),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 70.0, sigmaY: 70.0),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Padding(
              padding: padding ?? EdgeInsets.zero,
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
