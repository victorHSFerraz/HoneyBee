import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'injection_container.dart' as di;

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded(
    () async {
      _setAndroidSystemUIColor();
      await di.init();
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

void _setAndroidSystemUIColor() {
  return SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}
