import 'package:flutter/material.dart';
import 'package:muyufar_game/infrastructure/theme/theme.dart';
import 'presentation/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(),
      home: const SplashPage(),
    );
  }
}
