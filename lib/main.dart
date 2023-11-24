import 'package:biyer_juti/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'util/global_function.dart';
import 'util/page_navigation.dart';

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
      // themeMode: ThemeMode.system,
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true).copyWith(textTheme: GoogleFonts.outfitTextTheme()),
      darkTheme: ThemeData.light(useMaterial3: true).copyWith(textTheme: GoogleFonts.outfitTextTheme()),
      home: const SplashScreen(),
    );
  }
}
