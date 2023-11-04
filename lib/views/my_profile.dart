import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/welcome.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/bottom_navigation.dart';
import '../component/button.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const ThemeNavigation(currentIndex: 3),
        appBar: ThemeAppBar.primary,
        body: Center(
            child: Column(children: [
          Gap.infinity,
          FlutterLogo(size: MediaQuery.of(context).size.width / 2),
          Gap.infinity,
          ThemeButton.primary(title: "SIGN OUT", onTap: () => route(context, const Welcome()), gradient: ThemeGradient.secondary)
        ])));
  }
}
