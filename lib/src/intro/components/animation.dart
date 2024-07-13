import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class AnimatedUpDownWidget extends StatefulWidget {
  final double start;
  final double startStop;
  final double end;
  final double endStop;

  const AnimatedUpDownWidget({
    super.key,
    this.start = 0.0,
    this.end = 100.0,
    this.startStop = 60,
    this.endStop = 50,
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
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: widget.start, end: widget.end)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.end),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.end, end: widget.end + widget.endStop)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.end + widget.endStop),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(
                begin: widget.end + widget.endStop,
                end: widget.start + widget.startStop)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.start + widget.startStop),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.start + widget.startStop, end: widget.start)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.start),
        weight: 2,
      ),
    ]).animate(_controller);

    if (mounted) {
      _controller.repeat();
    }
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

class AnimatedOppositeUpDownWidget extends StatefulWidget {
  final double start;
  final double startStop;
  final double end;
  final double endStop;

  const AnimatedOppositeUpDownWidget({
    super.key,
    this.start = 0.0,
    this.end = 100.0,
    this.startStop = 0,
    this.endStop = 0,
  });
  @override
  createState() => _AnimatedOppositeUpDownWidgetState();
}

class _AnimatedOppositeUpDownWidgetState
    extends State<AnimatedOppositeUpDownWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: widget.end, end: widget.start)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.start),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.start, end: widget.start + widget.startStop)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.start + widget.startStop),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(
                begin: widget.start + widget.startStop,
                end: widget.end + widget.endStop)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.end + widget.endStop),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.end + widget.endStop, end: widget.end)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.end),
        weight: 2,
      ),
    ]).animate(_controller);

    if (mounted) {
      _controller.repeat();
    }
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
