// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

// Project imports:
import '../../../../core/constants/server/end_points.dart';
import '../../../../core/logic/interceptor/interceptor.dart';
import '../../data/models/login_model.dart';
import '../../data/requests/login_request.dart';
import '../services/authentication_services.dart';

class AuthenticationRepo {
  static final AuthenticationRepo _instance = AuthenticationRepo._internal();
  static final _dio = Dio()..interceptors.add(ApplicationInterceptor());
  factory AuthenticationRepo() {
    return _instance;
  }

  AuthenticationRepo._internal();

  static final AuthenticationServices _authenticationServices =
      AuthenticationServices(_dio, baseUrl: EndPoints.api);



  Future<HttpResponse<LoginModel?>> login(LoginRequest request) async {
    return await _authenticationServices.login(request);
  }
}
