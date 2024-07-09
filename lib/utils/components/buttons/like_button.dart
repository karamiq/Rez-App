import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    super.key,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  bool clicked = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 25, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50, end: 25),
        weight: 50,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: clicked
                  ? SvgPicture.asset(
                      Assets.assetsSvgHeartFilled,
                      key: ValueKey<bool>(clicked),
                      color: Colors.red,
                      height: _sizeAnimation.value,
                    )
                  : SvgPicture.asset(
                      height: _sizeAnimation.value,
                      Assets.assetsSvgHeart,
                      key: ValueKey<bool>(clicked),
                      color: Colors.white,
                    ),
            ),
            onPressed: () {
              setState(() {
                clicked = !clicked;
                if (clicked) {
                  _controller.forward();
                  //DO SOMTHING
                } else {
                  //DO SOMTHING
                  _controller.reverse();
                }
              });
            },
          );
        },
      ),
    );
  }
}
