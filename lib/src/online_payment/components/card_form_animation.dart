import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class CardFormAnimation extends StatefulWidget {
  const CardFormAnimation({
    super.key,
    required this.title,
    required this.content,
  });
  final Widget title;
  final Widget content;

  @override
  createState() => _CardFormAnimationState();
}

class _CardFormAnimationState extends State<CardFormAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isExpanded = false;
  double height = 0;

  final GlobalKey _containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getContainerHeight();
    });

    return AnimatedBuilder(
      key: _containerKey,
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
                    height: (_animation.value * height * 2),
                    child: FadeTransition(
                      alwaysIncludeSemantics: true,
                      opacity: _animation,
                      child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: widget.content),
                    ),
                  ),
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

  void _getContainerHeight() {
    final RenderBox renderBox =
        _containerKey.currentContext?.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    print('Container height: $height');
  }
}
