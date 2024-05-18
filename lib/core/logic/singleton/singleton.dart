// ignore_for_file: depend_on_referenced_packages

// Dart imports:
import 'dart:io';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import '../../constants/server/caching_services.dart';
import '../../services/snack/snack.dart';

final GetIt getIt = GetIt.instance;

Future<void> singleton() async {
  late dynamic dir;
  if (Platform.isAndroid || Platform.isIOS) {
    dir = await getApplicationDocumentsDirectory();
  } else {
    dir = 'assets/path';
  }
  Hive.init(dir.path);
  await Hive.openBox<dynamic>('myBox');
  final box = Hive.box('myBox');
  getIt.registerLazySingleton(() => CachingServices(box));
  getIt.registerLazySingleton(() => Snack());
}
