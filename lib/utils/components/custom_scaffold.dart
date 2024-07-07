import 'dart:ui';

import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding,
    this.appBar,
  });

  final AppBar? appBar;
  final EdgeInsetsGeometry? padding;
  final Widget body;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar ??
          AppBar(
            backgroundColor: Colors.transparent,
          ),
      body: Stack(
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
                color: Color(0xFF30102E),
              ),
            ),
          ),
          Positioned(
            top: 20 + (appBar != null ? MediaQuery.of(context).padding.top : 0),
            left: -20,
            child: Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0B1443),
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
    );
  }
}
