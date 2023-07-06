import 'package:flutter/material.dart';
import 'layers/presenter/presenter.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'HoneyBee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    ),
  );
}
