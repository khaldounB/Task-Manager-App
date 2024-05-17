// Package imports:
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

// Project imports:

import '../../constants/server/caching_services.dart';


CachingServices box = GetIt.instance.get<CachingServices>();


/// Screen size methods
double height(double newHeight) {
  double finalHeight = (newHeight * 100) / 812;
  return finalHeight.h;
}

double width(double newWidth) {
  double finalWidth = (newWidth * 100) / 375;
  return finalWidth.w;
}


