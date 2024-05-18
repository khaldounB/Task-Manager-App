// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../core/constants/material_design/k_keys.dart';
import '../../../core/logic/singleton/statics.dart';
import '../data/requests/login_request.dart';
import '../network/repo/authentication_repo.dart';

class LoginProvider extends ChangeNotifier{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthenticationRepo _repo = AuthenticationRepo();

  Future<void> login(LoginRequest request,BuildContext context)async{
    await _repo.login(request).then((value){
      if(value.response.statusCode == 200){
        Map<String,dynamic> data = {
          KKeys().id : value.data.id,
          KKeys().email : value.data.email,
          KKeys().token : value.data.token,
          KKeys().firstName : value.data.firstName,
          KKeys().gender : value.data.gender,
          KKeys().image : value.data.image,
          KKeys().lastName : value.data.lastName,
          KKeys().username : value.data.username,
        };
        box.saveFromMap(map: data);
        context.pushReplacement('/home');
      }else if(value.response.statusCode == 400){
        snack.showErrorSnack(context: context, message: 'Username Or Password Is Wrong');
      }else{
        snack.showErrorSnack(context: context, message: 'Something Wrong, Please Try Later');
      }
    });
  }
}
