// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../logic/singleton/statics.dart';
import '../text/text_network.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.function});
  final Function function;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: width(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width(197),
            height: height(181),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/no-internet-image.png'))),
          ),
          SizedBox(
            height: height(10),
          ),
          GestureDetector(
            onTap: ()=>function(),
            child: Container(
              width: double.infinity,
              height: height(49),
              decoration: BoxDecoration(
                  color: color.kDarkOrangColor,
                  borderRadius: BorderRadius.circular(width(20))
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextNetwork(

                    text: "اعادة المحاولة",
                    color: color.kScaffoldColor,
                    fontFamily: fonts.kBold,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
