import 'package:biyer_juti/component/pagination.dart';
import 'package:biyer_juti/component/profile_card.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../api/dummy_daya.dart';
import '../component/app_bar.dart';
import '../util/global_function.dart';

class Online extends StatefulWidget {
  const Online({Key? key}) : super(key: key);

  @override
  State<Online> createState() => _OnlineState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class _OnlineState extends State<Online> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(premium: true),
        body: ListView(padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 8), children: [
          const SectionHeader(label: "Online Profiles", topGap: false),
          ...List.generate(
              29,
              (index) => ProfileCard(
                  id: index,
                  online: true,
                  premium: index % 4 == 0,
                  hearted: index % 2 == 0,
                  match: index % 5 == 0,
                  requestState: DummyData.currentRequestState[randomNumber(DummyData.currentRequestState.length)])),
          const Pagination(),
        ]));
  }
}
