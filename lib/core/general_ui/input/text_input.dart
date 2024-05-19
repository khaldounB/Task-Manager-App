// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sizer/sizer.dart';

// Project imports:
import '../../constants/material_design/k_colors.dart';
import '../../constants/material_design/k_fonts.dart';
import '../../logic/singleton/statics.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.hint,
      required this.heighte,
      required this.widthe,
      required this.controller,
      required this.textInputType,
      this.colors = const Color(0xffF5F5F8),

      required this.error,
      this.provider});

  final String hint;
  final double heighte;
  final double widthe;
  final TextInputType textInputType;
  final TextEditingController controller;
  final Color colors;
  final bool error;

  final provider;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: widthe,
      height: heighte,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(width(10)),
          border: Border.all(
              width: width(1),
              color: error ? KColors().kDarkRedColor : Colors.transparent)),
      child: TextFormField(
        onTap: () {},

        controller: controller,
        keyboardType: textInputType,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontFamily: KFonts().kMedium,
            fontSize: width(16),
            color: Colors.black,
            fontWeight: FontWeight.w700),
        cursorColor: KColors().kLightGray,
        cursorRadius: Radius.circular(10.w),
        maxLines: 1,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            height: 0,
          ),
          focusedErrorBorder: InputBorder.none,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width(10)),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.only(
              right: width(20), top: height(20), left: width(20)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width(10)),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width(10)),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width(10)),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: width(16),
              fontFamily: KFonts().kMedium,
              color: Colors.black,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
