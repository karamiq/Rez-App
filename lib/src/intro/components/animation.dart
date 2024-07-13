import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class AnimatedUpDownWidget extends StatefulWidget {
  final double start;
  final double end;
  final Duration duration;
  final Duration initialDelay;

  const AnimatedUpDownWidget({
    super.key,
    this.start = 0.0,
    this.end = 100.0,
    this.duration = const Duration(milliseconds: 500),
    this.initialDelay = Duration.zero,
  });
  @override
  createState() => _AnimatedUpDownWidgetState();
}

class _AnimatedUpDownWidgetState extends State<AnimatedUpDownWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration * 2 + const Duration(milliseconds: 2000),
    );
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: widget.start, end: widget.end)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.end),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.end, end: widget.start)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.start),
        weight: 1,
      ),
    ]).animate(_controller);

    Future.delayed(widget.initialDelay, () {
      if (mounted) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: SvgPicture.asset(
              Assets.assetsSvgMusicColumn,
              height: 200,
            ),
          );
        },
      ),
    );
  }
}
