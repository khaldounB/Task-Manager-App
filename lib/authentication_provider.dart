// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'core/constants/material_design/k_keys.dart';
import 'core/logic/singleton/statics.dart';

class AuthenticationProvider extends ChangeNotifier {
  AuthenticationProvider({required BuildContext context}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await app(context: context);
    });
  }

  Future<void> app({required BuildContext context}) async {
    if ((box.getSaveData(key: KKeys().token) ?? "0") != "0") {
      context.pushReplacement('/login');
    } else {
      context.pushReplacement('/login');
    }
  }
}
