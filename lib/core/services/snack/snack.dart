// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../constants/material_design/k_colors.dart';
import '../../constants/material_design/k_fonts.dart';
import '../../general_ui/text/text_network.dart';

class Snack{
  void showErrorSnack(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: KColors().kDarkRedColor,
        content: TextNetwork(
          text: message,
          color: KColors().kScaffoldColor,
          fontFamily: KFonts().kBold,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),

        duration: const Duration(seconds: 3),
        //backgroundColor: color.kBlackRedColor
      ),
    );
  }
}
