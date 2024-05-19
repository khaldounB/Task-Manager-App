import 'package:flutter/material.dart';

import '../../../features/authentication/providers/login_provider.dart';
import '../../logic/singleton/statics.dart';

class LoginServices{
  bool checkLogin({required LoginProvider provider, required BuildContext context}){
    provider.passwordError = false;
    provider.usernameError = false;
    if(provider.usernameController.text.isEmpty && provider.passwordController.text.isEmpty){
      provider.passwordError = true;
      provider.usernameError = true;
      snack.showErrorSnack(context: context, message: 'Please fill username and password.');
      return false;
    }else if(provider.usernameController.text.isEmpty){
      provider.usernameError = true;
      snack.showErrorSnack(context: context, message: 'Please fill username.');
      return false;
    }else if(provider.passwordController.text.isEmpty){
      provider.passwordError = true;
      snack.showErrorSnack(context: context, message: 'Please fill password.');
      return false;
    }
    return true;
  }
}