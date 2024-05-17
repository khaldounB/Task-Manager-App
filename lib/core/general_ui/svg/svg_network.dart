// ignore_for_file: deprecated_member_use

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

class SvgNetwork extends StatelessWidget {
  const SvgNetwork({
    super.key,
    required this.path,
    required this.width,
    required this.height,
    required this.color,
  });

  final String path;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      path,
      color: color == Colors.transparent ? null : color,
      width: width,
      height: height,
    );
  }
}
