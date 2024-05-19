// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../../core/constants/material_design/k_colors.dart';
import '../../../../core/constants/material_design/k_fonts.dart';
import '../../../../core/general_ui/input/password_input.dart';
import '../../../../core/general_ui/input/text_input.dart';
import '../../../../core/general_ui/progress_animated/progress_animated_widget.dart';
import '../../../../core/general_ui/text/text_network.dart';
import '../../../../core/logic/singleton/statics.dart';
import '../../../../core/services/login_services/login_services.dart';
import '../../data/requests/login_request.dart';
import '../../providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: Scaffold(
        backgroundColor: KColors().kScaffoldColor,
        appBar: AppBar(
          backgroundColor: KColors().kScaffoldColor,
          surfaceTintColor: KColors().kScaffoldColor,
          centerTitle: true,
          title: TextNetwork(
            text: 'Login',
            color: KColors().kDarkBlackColor,
            fontFamily: KFonts().kBold,
            fontSize: 18,
          ),
        ),
        body: Consumer<LoginProvider>(builder: (context, provider, child) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: width(20),
            ),
            children: [
              TextNetwork(
                text: 'Please fill with your username and password',
                color: KColors().kDarkBlackColor,
                fontFamily: KFonts().kBold,
                fontSize: 18,
                align: TextAlign.center,
              ),
              SizedBox(
                height: height(30),
              ),
              TextInput(
                  hint: 'Username',
                  colors: Colors.white,
                  heighte: height(49),
                  widthe: double.infinity,
                  controller: provider.usernameController,
                  textInputType: TextInputType.name,
                  error: provider.usernameError),
              SizedBox(
                height: height(30),
              ),
              PasswordInput(
                hint: 'Password',
                colors: Colors.white,
                heighte: height(49),
                widthe: double.infinity,
                controller: provider.passwordController,
                textInputType: TextInputType.name,
                error: provider.passwordError,
                show: !provider.passwordHidden,
                provider: provider,
              ),
              SizedBox(
                height: height(30),
              ),
              GestureDetector(
                onTap: () async {
                  if (LoginServices()
                      .checkLogin(provider: provider, context: context) && !provider.load) {
                    await provider.login(
                        LoginRequest(provider.usernameController.text,
                            provider.passwordController.text),
                        context);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: height(49),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width(8)),
                      color: Colors.cyan),
                  child: provider.load?
                  LoadingLine(colors: KColors().kScaffoldColor)
                      : TextNetwork(
                    text: 'Login',
                    color: KColors().kDarkBlackColor,
                    fontFamily: KFonts().kBold,
                    fontSize: 18,
                    align: TextAlign.center,
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
