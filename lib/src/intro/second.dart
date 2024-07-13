import 'package:app/src/intro/components/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_lib.dart';
import '../../utils/components/buttons/gardient_border_button.dart';
import '../../utils/components/custom_scaffold.dart';
import '../../utils/constants/sizes.dart';

class SecondIntroPage extends StatefulWidget {
  const SecondIntroPage({super.key});

  @override
  State<SecondIntroPage> createState() => _SecondIntroPageState();
}

class _SecondIntroPageState extends State<SecondIntroPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    while (mounted) {
      await _controller.forward();
      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted) {
        await _controller.reverse();
        await Future.delayed(const Duration(milliseconds: 300));
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: Insets.mediumAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(75),
              const SizedBox(
                height: 400,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AnimatedUpDownWidget(
                      start: 0.0,
                      end: 300.0,
                    ),
                    AnimatedUpDownWidget(
                      start: 20.0,
                      end: 120.0,
                    ),
                    AnimatedUpDownWidget(
                      start: 40.0,
                      end: 300.0,
                    ),
                    AnimatedUpDownWidget(
                      start: 0.0,
                      end: 80.0,
                    ),
                    AnimatedUpDownWidget(
                      start: 60.0,
                      end: 200.0,
                    ),
                    AnimatedUpDownWidget(
                      start: 10.0,
                      end: 140.0,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Gap(Insets.extraLarge),
              Text(
                'Let The Music go Into your Ears ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: GoogleFonts.exo().fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: FontsTheme.veryBigSize,
                ),
              ),
              const Gap(Insets.extraLarge),
              GradientBorderButton(
                onPressed: () {
                  context.go(RoutesDocument.tabs);
                },
                text: 'Start',
                isShadow: false,
                borderColors: const [Color(0xFFff23d5), Color(0xFF3f1270)],
                colors: const [
                  Color(0xFFb5116b),
                  Color(0xFFa7116b),
                  Color(0xFF8b116d),
                  Color(0xFF69126e),
                  Color(0xFF3f1270),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        tween: ConstantTween<double>(widget.end), // Pause at end
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.end, end: widget.start)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(widget.start), // Pause at start
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
