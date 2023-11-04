import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/bottom_navigation.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: const ThemeNavigation(currentIndex: 3), appBar: ThemeAppBar.primary, body: Center(child: FlutterLogo(size: MediaQuery.of(context).size.width / 2)));
  }
}
