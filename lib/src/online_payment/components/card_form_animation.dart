import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class CardFormAnimation extends StatefulWidget {
  const CardFormAnimation({
    super.key,
    required this.title,
    required this.content,
    required this.contenetHeight,
  });
  final Widget title;
  final Widget content;
  final double contenetHeight;

  @override
  createState() => _CardFormAnimationState();
}

class _CardFormAnimationState extends State<CardFormAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    setState(() {
      isExpanded = !isExpanded;
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.all(
              Insets.medium - (_animation.value * Insets.medium)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  widget.title,
                  Container(
                      decoration: const BoxDecoration(
                        color: ColorsTheme.lightPrimary,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(BorderSize.small)),
                      ),
                      height: (_animation.value * widget.contenetHeight),
                      child: FadeTransition(
                        alwaysIncludeSemantics: true,
                        opacity: _animation,
                        child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: widget.content),
                      )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
