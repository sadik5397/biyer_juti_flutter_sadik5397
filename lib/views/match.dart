import 'package:biyer_juti/component/pagination.dart';
import 'package:biyer_juti/component/profile_card.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../api/dummy_daya.dart';
import '../component/app_bar.dart';
import '../component/match_stat.dart';
import '../util/global_function.dart';

class Match extends StatefulWidget {
  const Match({Key? key}) : super(key: key);

  @override
  State<Match> createState() => _MatchState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class _MatchState extends State<Match> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(premium: true),
        body: ListView(padding: ThemePadding.p6.copyWith(top: ThemePadding.value * 8), children: [
          MatchStat(heartRcvd: randomNumber(999), match: randomNumber(99)),
          Padding(padding: ThemePadding.pb2, child: const SectionHeader(label: "Matched Profiles", topGap: false, fontSize: 16)),
          ...List.generate(
              9,
              (index) => ProfileCard(
                  id: index,
                  online: index % 3 == 0,
                  premium: index % 4 == 0,
                  hearted: index % 2 == 0,
                  match: true,
                  imageUrl: "https://picsum.photos/400/410?random=${randomNumber(90)}",
                  requestState: DummyData.currentRequestState[randomNumber(DummyData.currentRequestState.length)])),
          const Pagination(),
        ]));
  }
}
