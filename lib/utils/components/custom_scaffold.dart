import 'dart:ui';

import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding,
    this.safeArea = true,
  });

  final EdgeInsetsGeometry? padding;
  final Widget body;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool safeArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: safeArea,
        bottom: safeArea,
        left: safeArea,
        right: safeArea,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).padding.top +
                  MediaQuery.of(context).size.height / 5,
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
              top: 30,
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
            Positioned(
              bottom: 60,
              left: -20,
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(151, 11, 20, 67),
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
