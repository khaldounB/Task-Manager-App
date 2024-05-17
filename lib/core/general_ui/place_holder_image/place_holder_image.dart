// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../logic/singleton/statics.dart';
import '../loading_animation_widget/src/build_loading_animation.dart';

// Project imports:


class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({super.key, required this.h, required this.w, required this.size});
  final double h;
  final double w;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(w),
      height: height(h),
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: color.kLightGray.withOpacity(0.7),
        size: size,
      ),
    );
  }
}

// class PlaceHolderImage extends StatefulWidget {
//   final Color color;
//
//   const PlaceHolderImage({
//     super.key,
//     required this.color,
//   });
//
//   @override
//   State<PlaceHolderImage> createState() => _PlaceHolderImage();
// }
//
// class _PlaceHolderImage extends State<PlaceHolderImage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _offsetController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _offsetController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1600),
//     )..repeat();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Container(
//       alignment: Alignment.center,
//       // color: Colors.black,
//       width: width(210),
//       height: height(144),
//       child: AnimatedBuilder(
//         animation: _offsetController,
//         builder: (_, __) => Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             DotContainer(
//               controller: _offsetController,
//               heightInterval: const Interval(0.0, 0.1),
//               offsetInterval: const Interval(0.18, 0.28),
//               reverseHeightInterval: const Interval(0.28, 0.38),
//               reverseOffsetInterval: const Interval(0.47, 0.57),
//               color: widget.color,
//               size: 30,
//               maxHeight: height(10),
//             ),
//             DotContainer(
//               controller: _offsetController,
//               heightInterval: const Interval(0.09, 0.19),
//               offsetInterval: const Interval(0.27, 0.37),
//               reverseHeightInterval: const Interval(0.37, 0.47),
//               reverseOffsetInterval: const Interval(0.56, 0.66),
//               color: widget.color,
//               size: 10,
//               maxHeight: height(10),
//             ),
//             DotContainer(
//               controller: _offsetController,
//               heightInterval: const Interval(0.0, 0.1),
//               offsetInterval: const Interval(0.18, 0.28),
//               reverseHeightInterval: const Interval(0.28, 0.38),
//               reverseOffsetInterval: const Interval(0.47, 0.57),
//               color: widget.color,
//               size: 10,
//               maxHeight: height(10),
//             ),
//             DotContainer(
//               controller: _offsetController,
//               heightInterval: const Interval(0.0, 0.1),
//               offsetInterval: const Interval(0.18, 0.28),
//               reverseHeightInterval: const Interval(0.28, 0.38),
//               reverseOffsetInterval: const Interval(0.47, 0.57),
//               color: widget.color,
//               size: 10,
//               maxHeight: height(10),
//             ), DotContainer(
//               controller: _offsetController,
//               heightInterval: const Interval(0.0, 0.1),
//               offsetInterval: const Interval(0.18, 0.28),
//               reverseHeightInterval: const Interval(0.28, 0.38),
//               reverseOffsetInterval: const Interval(0.47, 0.57),
//               color: widget.color,
//               size: 10,
//               maxHeight: height(10),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _offsetController.dispose();
//     super.dispose();
//   }
// }
//
// class DotContainer extends StatelessWidget {
//   final Interval offsetInterval;
//   final double size;
//   final Color color;
//
//   final Interval reverseOffsetInterval;
//   final Interval heightInterval;
//   final Interval reverseHeightInterval;
//   final double maxHeight;
//   final AnimationController controller;
//
//   const DotContainer({
//     super.key,
//     required this.offsetInterval,
//     required this.size,
//     required this.color,
//     required this.reverseOffsetInterval,
//     required this.heightInterval,
//     required this.reverseHeightInterval,
//     required this.maxHeight,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final double maxDy = -(size * 0.20);
//
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (_, __) {
//         return Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Opacity(
//               opacity: controller.value <= offsetInterval.end ? 1 : 0,
//               // opacity: 1,
//               child: Transform.translate(
//                 offset: Tween<Offset>(
//                   begin: Offset.zero,
//                   end: Offset(0, maxDy),
//                 )
//                     .animate(
//                   CurvedAnimation(
//                     parent: controller,
//                     curve: offsetInterval,
//                   ),
//                 )
//                     .value,
//                 child: Container(
//                   width: size * 0.13,
//                   height: Tween<double>(
//                     begin: size * 0.13,
//                     end: maxHeight,
//                   )
//                       .animate(
//                     CurvedAnimation(
//                       parent: controller,
//                       curve: heightInterval,
//                     ),
//                   )
//                       .value,
//                   decoration: BoxDecoration(
//                     color: color,
//                     borderRadius: BorderRadius.circular(size),
//                   ),
//                 ),
//               ),
//             ),
//             Opacity(
//               opacity: controller.value >= offsetInterval.end ? 1 : 0,
//               child: Transform.translate(
//                 offset: Tween<Offset>(
//                   begin: Offset(0, maxDy),
//                   end: Offset.zero,
//                 )
//                     .animate(
//                   CurvedAnimation(
//                     parent: controller,
//                     curve: reverseOffsetInterval,
//                   ),
//                 )
//                     .value,
//                 child: Container(
//                   width: size * 0.13,
//                   height: Tween<double>(
//                     end: size * 0.13,
//                     begin: maxHeight,
//                   )
//                       .animate(
//                     CurvedAnimation(
//                       parent: controller,
//                       curve: reverseHeightInterval,
//                     ),
//                   )
//                       .value,
//                   decoration: BoxDecoration(
//                     color: color,
//                     borderRadius: BorderRadius.circular(size),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
