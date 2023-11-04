import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/bottom_navigation.dart';
import '../component/notification_tile.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const ThemeNavigation(currentIndex: 2),
        appBar: ThemeAppBar.primary,
        body: ListView(padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 8), children: [
          ...List.generate(40, (index) => NotificationTile(index: index, onTap: () {})),
        ]));
  }
}
