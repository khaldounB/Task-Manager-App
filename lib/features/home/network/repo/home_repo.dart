// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

// Project imports:
import '../../../../core/constants/server/end_points.dart';
import '../../../../core/logic/interceptor/interceptor.dart';
import '../../data/models/me_model.dart';
import '../../data/models/refresh_token_model.dart';
import '../services/home_services.dart';

class HomeRepo {
  static final HomeRepo _instance = HomeRepo._internal();
  static final _dio = Dio()..interceptors.add(ApplicationInterceptor());
  factory HomeRepo() {
    return _instance;
  }

  HomeRepo._internal();

  static final HomeServices _HomeServices =
      HomeServices(_dio, baseUrl: EndPoints.api);

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

  Future<HttpResponse<MeModel>> me() async =>
      await retry(() async => await _HomeServices.me());

  Future<HttpResponse<RefreshTokenModel>> refreshToken() async =>
      await retry(() async => await _HomeServices.refreshToken());
}
