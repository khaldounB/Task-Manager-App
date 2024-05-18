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

  Future<T> retry<T>(
    Future<T> Function() apiCall, {
    int maxRetries = 3,
    Duration delay = const Duration(seconds: 0),
  }) async {
    int retryCount = 0;

    Future<T> tryApiCall() async {
      try {
        return await apiCall();
      } catch (error) {
        debugPrint('Error Handling: $error');

        if (retryCount < maxRetries) {
          await Future.delayed(delay);
          retryCount++;
          return tryApiCall();
        } else {
          rethrow;
        }
      }
    }

    return tryApiCall();
  }

  Future<HttpResponse<LoginModel>> login(LoginRequest request) async {
    return await retry(
        () async => await _authenticationServices.login(request));
  }
}
