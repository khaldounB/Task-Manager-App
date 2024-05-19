import '../../../features/authentication/data/models/login_model.dart';
import '../../constants/material_design/k_keys.dart';
import '../../logic/singleton/statics.dart';

class AuthServices{
  void saveData(LoginModel loginModel){
    Map<String,dynamic> data = {
      KKeys().id : loginModel.id,
      KKeys().email : loginModel.email,
      KKeys().token : loginModel.token,
      KKeys().firstName : loginModel.firstName,
      KKeys().gender : loginModel.gender,
      KKeys().image : loginModel.image,
      KKeys().lastName : loginModel.lastName,
      KKeys().username : loginModel.username,
    };

    box.saveFromMap(map: data);
  }

  void deleteData(){
    box.deleteFromList(list: [
      KKeys().id,
      KKeys().email,
      KKeys().token,
      KKeys().firstName,
      KKeys().gender,
      KKeys().image,
      KKeys().lastName,
      KKeys().username,
    ]);
  }
}
