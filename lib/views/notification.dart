import 'package:biyer_juti/component/pagination.dart';
import 'package:biyer_juti/component/profile_card.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/dummy_daya.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../component/app_bar.dart';
import '../component/notification_tile.dart';
import '../component/profile_search.dart';
import '../util/global_function.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary,
        body: ListView(padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 8), children: [
          ...List.generate(40, (index) => NotificationTile(index: index, onTap: () {})),
        ]));
  }
}
