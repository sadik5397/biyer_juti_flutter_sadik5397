import 'package:biyer_juti/component/bottom_navigation.dart';
import 'package:biyer_juti/component/heart_stat.dart';
import 'package:biyer_juti/component/pagination.dart';
import 'package:biyer_juti/component/profile_card.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../util/dummy_daya.dart';
import '../util/global_function.dart';

class HeartReceived extends StatefulWidget {
  const HeartReceived({Key? key}) : super(key: key);

  @override
  State<HeartReceived> createState() => _HeartReceivedState();
}

class _HeartReceivedState extends State<HeartReceived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const ThemeNavigation(currentIndex: 1),
        appBar: ThemeAppBar.primary,
        body: ListView(padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 8), children: [
          const HeartStat(heartReceived: 999, heartGiven: 99),
          ...List.generate(
              40,
              (index) => ProfileCard(
                  id: index,
                  online: index % 3 == 0,
                  premium: index % 4 == 0,
                  hearted: index % 2 == 0,
                  match: index % 5 == 0,
                  requestState: DummyData.currentRequestState[randomNumber(DummyData.currentRequestState.length)])),
          const Pagination(),
        ]));
  }
}
