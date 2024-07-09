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
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
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
              const Row(),
              const Gap(75),
              Container(
                height: 400,
                width: 500,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AnimatedUpDownWidget(
                      child: SvgPicture.asset(
                        Assets.assetsSvgMusicColumn,
                        height: 200,
                      ),
                    )
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
  final Widget child;
  final double start;
  final double end;
  final Duration duration;

  const AnimatedUpDownWidget({
    required this.child,
    this.start = 0.0,
    this.end = 100.0,
    this.duration = const Duration(seconds: 1),
  });

  @override
  _AnimatedUpDownWidgetState createState() => _AnimatedUpDownWidgetState();
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
      duration: widget.duration,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: widget.start, end: widget.end).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _animation.value),
          child: widget.child,
        );
      },
    );
  }
}
