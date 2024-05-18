// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

// Project imports:
import '../../../../core/constants/server/end_points.dart';
import '../../data/models/login_model.dart';
import '../../data/requests/login_request.dart';

part 'authentication_services.g.dart';

@RestApi(baseUrl: EndPoints.api)
abstract class AuthenticationServices{
  factory AuthenticationServices(Dio dio, {String baseUrl}) =
  _AuthenticationServices;
  
  @POST(EndPoints.login)
  Future<HttpResponse<LoginModel>> login(@Body() LoginRequest request);
}
