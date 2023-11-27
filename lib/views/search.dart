import 'package:biyer_juti/component/app_bar.dart';
import 'package:flutter/material.dart';

import '../api/dummy_daya.dart';
import '../component/bottom_navigation.dart';
import '../component/pagination.dart';
import '../component/profile_card.dart';
import '../component/profile_search.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../util/global_function.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const ThemeNavigation(currentIndex: 0),
        appBar: ThemeAppBar.primary(hideBack: true),
        body: ListView(padding: ThemePadding.p6.copyWith(top: ThemePadding.value * 8), children: [
          const ProfileSearch(needToBePremium: false),
          Text("Search Results", textAlign: TextAlign.center, style: TextStyle(color: ThemeColor.superRed, fontSize: 16, fontWeight: FontWeight.bold)),
          Gap.gy4,
          const Pagination(),
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
