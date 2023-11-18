import 'package:biyer_juti/api/dummy_daya.dart';
import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/progress.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../component/custom_information_section.dart';
import '../component/dropdown_button.dart';
import '../component/text_field.dart';

class SignUp4PhotoInformation extends StatefulWidget {
  const SignUp4PhotoInformation({super.key});

  @override
  State<SignUp4PhotoInformation> createState() => _SignUp4PhotoInformationState();
}

class _SignUp4PhotoInformationState extends State<SignUp4PhotoInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        appBar: ThemeAppBar.blank,
        body: ListView(padding: ThemePadding.px6, children: [
          Image.asset("assets/logo-wide.png", height: 75),
          const SectionHeader(label: "Family Information", topGap: false),
          Gap.gy2,
          CustomInformationSection(header: "Father’s Information *", children: [
            Gap.gy4,
            Row(children: [
              ThemeDropDownButton.expandedSearch(title: "Profession", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1),
              Gap.gx3,
              ThemeDropDownButton.expandedSearch(title: "Hometown", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1)
            ])
          ]),
          Gap.gy4,
          Gap.gy4,
          CustomInformationSection(header: "Mother’s Information *", children: [
            Gap.gy4,
            Row(children: [
              ThemeDropDownButton.expandedSearch(title: "Profession", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1),
              Gap.gx3,
              ThemeDropDownButton.expandedSearch(title: "Hometown", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1),
            ])
          ]),
          Gap.gy4,
          Gap.gy4,
          CustomInformationSection(header: "Siblings *", children: [
            Gap.gy4,
            Row(children: [
              ThemeDropDownButton.expandedSearch(title: "# Brothers", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1),
              Gap.gx3,
              ThemeDropDownButton.expandedSearch(title: "# Sisters", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1),
            ])
          ]),
          Gap.gy4,
          Gap.gy4,
          CustomInformationSection(
              header: "Family Details (Optional)",
              children: [Gap.gy4, ThemeTextField.pill(labelText: "Write About Your Family", controller: TextEditingController(), maxLines: 5, showLabel: false, padding: ThemePadding.pb2)]),
          Gap.gy4,
          Gap.gy4,
          Gap.gy4,
          Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "NEXT", onTap: () {}, color: ThemeColor.primary)),
          const Progress(progress: 5, outOf: 6),
          Gap.gy6
        ]));
  }
}