// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import '../../logic/singleton/statics.dart';
import '../marquee/marquee.dart';

class TextNetwork extends StatelessWidget {
  const TextNetwork(
      {super.key,
      required this.text,
      required this.color,
      required this.fontFamily,
      required this.fontSize,
      this.padding = 5,
      this.maxWidth = 70,
      this.maxHeight = 25,
      this.align = TextAlign.start,
      this.textDecoration = TextDecoration.none,
      this.fontWeight = FontWeight.normal, this.maxLength = 1000});

  final String text;
  final Color color;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;
  final TextDecoration textDecoration;
  final double padding;
  final double maxLength;
  final double maxWidth;
  final double maxHeight;
  @override
  Widget build(BuildContext context) {
    return text.length > maxLength ? Container(
      padding: EdgeInsets.only(top: height(padding)),
      width: width(maxWidth),
      height: height(maxHeight),
      child: Marquee(
        fadingEdgeStartFraction: 0.2,
        fadingEdgeEndFraction: 0.2,
        style: TextStyle(
            fontSize: width(fontSize),
            height: height(1.5),
            fontFamily: fontFamily,
            color: color,fontWeight: fontWeight,decoration: textDecoration),
        crossAxisAlignment:
        CrossAxisAlignment.start,
        text: text,
        //  pauseAfterRound: Duration(seconds: 1),
        decelerationDuration:
        const Duration(milliseconds: 100),
        blankSpace: 20,
      ),
    ):Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height(padding),
        ),
        Text(
          text,
          textAlign: align,
          style: TextStyle(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: width(fontSize),
            decoration: textDecoration,
          ),
        ),
      ],
    );
  }
}
