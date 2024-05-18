// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../../../../core/constants/server/end_points.dart';
import '../../data/models/me_model.dart';
import '../../data/models/refresh_token_model.dart';

part 'home_services.g.dart';

@RestApi(baseUrl: EndPoints.api)
abstract class HomeServices{
  factory HomeServices(Dio dio, {String baseUrl}) =
  _HomeServices;


  @POST(EndPoints.refreshToken)
  Future<HttpResponse<RefreshTokenModel>> refreshToken();

  @GET(EndPoints.me)
  Future<HttpResponse<MeModel>> me();
}
