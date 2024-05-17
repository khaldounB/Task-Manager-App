// ignore_for_file: depend_on_referenced_packages

// Dart imports:
import 'dart:io';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import '../../constants/server/caching_services.dart';

final GetIt getIt = GetIt.instance;

Future<void> singletone()async{
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox<dynamic>('myBox');
  final box = Hive.box('myBox');
  getIt.registerLazySingleton(() => CachingServices(box));
}
