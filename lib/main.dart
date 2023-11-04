import 'package:biyer_juti/views/heart_received.dart';
import 'package:flutter/material.dart';

import 'util/global_function.dart';

void main() {
  initialConfiguration();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biyer Juti',
      themeMode: ThemeMode.system,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const HeartReceived(),
    );
  }
}
