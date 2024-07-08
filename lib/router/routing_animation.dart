import 'package:flutter/material.dart';

class FadeTransitionPage<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Duration duration; // Optional: Customize transition duration

  FadeTransitionPage(
      {required this.child, this.duration = const Duration(milliseconds: 300)})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
