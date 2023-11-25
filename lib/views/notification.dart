import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/bottom_navigation.dart';
import '../component/custom_toggle_fab.dart';
import '../component/notification_tile.dart';
import '../component/section_header.dart';

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
        floatingActionButton: CustomToggleFab(options: ["All", "Unread"]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: ThemeAppBar.primary(hideBack: true),
        body: ListView(padding: ThemePadding.p6.copyWith(top: ThemePadding.value * 8), children: [
          Padding(padding: ThemePadding.pb2, child: const SectionHeader(label: "Notifications", topGap: false, fontSize: 24)),
          ...List.generate(40, (index) => NotificationTile(index: index, onTap: () {})),
        ]));
  }
}
