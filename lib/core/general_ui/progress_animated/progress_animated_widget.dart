// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../logic/singleton/statics.dart';

class LoadingLine extends StatefulWidget {
  const LoadingLine({super.key, this.w = 200,this.h = 4, required this.colors});
  final double w;
  final double h;
  final Color colors;
  @override
  State<LoadingLine> createState() => _LoadingLineState();
}

class _LoadingLineState extends State<LoadingLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: width(widget.w),
            height: height(widget.h),
            decoration: BoxDecoration(
              color: color.kLightGray.withOpacity(0.2),
              borderRadius: BorderRadius.circular(width(5)),
            ),
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: _controller.value,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.colors,
                  borderRadius: BorderRadius.circular(width(5)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
