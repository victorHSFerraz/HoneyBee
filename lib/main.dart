import 'package:flutter/material.dart';
import 'package:honey_bee/bootstrap.dart';
import 'package:honey_bee/features/splash/presentation/page/splash_page.dart';
import 'injection_container.dart' as di;

import 'core/storage/i_storage.dart';

void main() async {
  await bootstrap();
  runApp(
    MaterialApp(
      title: 'HoneyBee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(storage: di.getIt<IStorage>()),
    ),
  );
}
