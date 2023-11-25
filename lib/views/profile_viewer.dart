import 'package:biyer_juti/component/pagination.dart';
import 'package:biyer_juti/component/profile_card.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../api/dummy_daya.dart';
import '../component/app_bar.dart';
import '../util/global_function.dart';

class ProfileViewer extends StatefulWidget {
  const ProfileViewer({Key? key}) : super(key: key);

  @override
  State<ProfileViewer> createState() => _ProfileViewerState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class _ProfileViewerState extends State<ProfileViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(premium: true),
        body: ListView(padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 8), children: [
          Padding(padding: ThemePadding.pb2, child: const SectionHeader(label: "Profile Viewers", topGap: false)),
          ...List.generate(
              29,
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
