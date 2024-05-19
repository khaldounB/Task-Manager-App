// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'authentication_provider.dart';
import 'core/constants/material_design/k_colors.dart';
import 'core/constants/material_design/k_fonts.dart';
import 'core/general_ui/internet/error_screen.dart';
import 'core/general_ui/internet/internet.dart';
import 'core/general_ui/progress_animated/progress_animated_widget.dart';
import 'core/general_ui/text/text_network.dart';
import 'core/logic/singleton/statics.dart';
import 'core/services/url_services/url_services.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<AuthenticationProvider>(
      create: (context) => AuthenticationProvider(context: context),
      child: Consumer<AuthenticationProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: height(500),
                  alignment: Alignment.center,
                  child: TextNetwork(
                    text: 'Task Manager',
                    color: KColors().kDarkBlackColor,
                    fontFamily: KFonts().kBold,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                LoadingLine(
                  colors: KColors().kLightGray,
                ),
                SizedBox(
                  height: height(120),
                ),
                InkWell(
                  onTap: (){
                    UrlServices().sendEmail('khaldounbadreahf@gmail.com', '', '');
                  },
                  child: TextNetwork(
                    text: 'khaldounbadreahf@gmail.com',
                    color: KColors().kLightGray,
                    fontFamily: KFonts().kMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: height(20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
