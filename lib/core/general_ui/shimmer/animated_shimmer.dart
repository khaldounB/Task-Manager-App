// Flutter imports:
import 'package:flutter/material.dart';

class AnimatedShimmer extends StatefulWidget {
  final double width;
  final double height;
  final Color? startColor;
  final Color? endColor;
  final BorderRadius borderRadius;
  final Duration delayInMilliSeconds;

  const AnimatedShimmer(
      {super.key,
      this.borderRadius = const BorderRadius.all(
        Radius.circular(0),
      ),
      this.startColor = const Color(0xffE6E8EB),
      this.endColor = const Color(0x77E6E8EB),
      this.delayInMilliSeconds = const Duration(milliseconds: 0),
      required this.width,
      required this.height})
      : assert((endColor != null && startColor != null));

  factory AnimatedShimmer.round({
    required double size,
    Color? startColor = const Color(0xffE6E8EB),
    Color? endColor = const Color(0x77E6E8EB),
  }) =>
      AnimatedShimmer(
        height: size,
        width: size,
        borderRadius: BorderRadius.all(
          Radius.circular(size / 2),
        ),
        startColor: startColor,
        endColor: endColor,
      );

  @override
  AnimatedShimmerState createState() => AnimatedShimmerState();
}

class AnimatedShimmerState extends State<AnimatedShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _colorAnimation = ColorTween(begin: widget.startColor, end: widget.endColor)
        .animate(_animationController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.delayInMilliSeconds.inMilliseconds == 0) {
        _animationController.forward();
      } else {
        Future.delayed(widget.delayInMilliSeconds, () {
          _animationController.forward();
        });
      }
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            borderRadius: widget.borderRadius,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose the AnimationController when the widget is disposed
    _animationController.dispose();
    super.dispose();
  }
}
