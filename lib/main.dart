import 'package:flutter/material.dart';
import 'util/global_function.dart';
import 'views/home.dart';

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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Home(),
    );
  }
}
