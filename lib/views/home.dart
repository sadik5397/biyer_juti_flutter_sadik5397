import 'package:biyer_juti/component/pagination.dart';
import 'package:biyer_juti/component/profile_card.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../component/profile_search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 8), children: [
          const ProfileSearch(),
          ...List.generate(40, (index) => ProfileCard(index: index, online: index % 3 == 0, premium: index % 4 == 0, hearted: index % 2 == 0, match: index % 5 == 0)),
          const Pagination(),
        ]));
  }
}
