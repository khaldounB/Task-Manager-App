// import 'package:flutter/material.dart';
//
// import '../../logic/singleton/statics.dart';
//
//
//
// class SwitchWidget extends StatelessWidget {
//   const SwitchWidget({super.key, required this.on,required this.provider});
//   final bool on;
//   final provider;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         provider.getNotification = !provider.getNotification;
//       },
//       child: AnimatedContainer(
//         width: width(50),
//         height: height(30),
//         duration: const Duration(milliseconds: 200),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(width(20)),
//             color: on ? color.kDarkOrangColor : color.kBlackWhiteColor),
//         child: Row(
//           children: [
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               width: on
//                   ? width(25)
//                   : width(5),
//             ),
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               height: height(20),
//               width: width(20),
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle, color: color.kWhiteColor),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
