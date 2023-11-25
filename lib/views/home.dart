import 'package:biyer_juti/component/bottom_navigation.dart';
import 'package:biyer_juti/component/heart_stat.dart';
import 'package:biyer_juti/component/pagination.dart';
import 'package:biyer_juti/component/profile_card.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../api/dummy_daya.dart';
import '../component/app_bar.dart';
import '../component/section_header.dart';
import '../util/global_function.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const ThemeNavigation(currentIndex: 0),
        appBar: ThemeAppBar.primary(hideBack: true, premium: true),
        body: ListView(padding: ThemePadding.p6.copyWith(top: ThemePadding.value * 8), children: [
          HeartStat(heartReceived: randomNumber(999), heartGiven: randomNumber(999)),
          Padding(padding: ThemePadding.pb2, child: const SectionHeader(label: "Hearts Received", topGap: false, fontSize: 16)),
          ...List.generate(
              40,
              (index) => ProfileCard(
                  id: index,
                  online: index % 3 == 0,
                  premium: index % 4 == 0,
                  hearted: index % 2 == 0,
                  match: index % 5 == 0,
                  imageUrl: "https://picsum.photos/400/410?random=${randomNumber(90)}",
                  requestState: DummyData.currentRequestState[randomNumber(DummyData.currentRequestState.length)])),
          const Pagination(),
        ]));
  }
}
