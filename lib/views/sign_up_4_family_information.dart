import 'package:biyer_juti/api/dummy_daya.dart';
import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/progress.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/sign_up_5_photo_information.dart';
import 'package:flutter/material.dart';

import '../component/custom_information_section.dart';
import '../component/dropdown_button.dart';
import '../component/text_field.dart';
import '../theme/border_radius.dart';

class SignUp4FamilyInformation extends StatefulWidget {
  const SignUp4FamilyInformation({super.key});

  @override
  State<SignUp4FamilyInformation> createState() => _SignUp4FamilyInformationState();
}

class _SignUp4FamilyInformationState extends State<SignUp4FamilyInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        appBar: ThemeAppBar.blank(),
        body: ListView(padding: ThemePadding.px6, children: [
          Image.asset("assets/logo-wide.png", height: 75),
          SectionHeader(label: "Family Information", topGap: false, color: ThemeColor.primary),
          Gap.gy2,
          CustomInformationSection(header: "Father’s Information *", children: [
            Gap.gy4,
            Row(children: [
              ThemeDropDownButton.expandedSearch(
                  title: "Profession", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1, labelColor: ThemeColor.secondary, useBorder: true),
              Gap.gx3,
              ThemeDropDownButton.expandedSearch(
                  title: "Hometown", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1, labelColor: ThemeColor.secondary, useBorder: true),
            ])
          ]),
          Gap.gy4,
          Gap.gy4,
          CustomInformationSection(header: "Mother’s Information *", children: [
            Gap.gy4,
            Row(children: [
              ThemeDropDownButton.expandedSearch(
                  title: "Profession", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1, labelColor: ThemeColor.secondary, useBorder: true),
              Gap.gx3,
              ThemeDropDownButton.expandedSearch(
                  title: "Hometown", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1, labelColor: ThemeColor.secondary, useBorder: true),
            ])
          ]),
          Gap.gy4,
          Gap.gy4,
          CustomInformationSection(header: "Siblings *", children: [
            Gap.gy4,
            Row(children: [
              ThemeDropDownButton.expandedSearch(
                  title: "# Brothers", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1, labelColor: ThemeColor.secondary, useBorder: true),
              Gap.gx3,
              ThemeDropDownButton.expandedSearch(
                  title: "# Sisters", options: DummyData.randomNames, value: null, onChanged: (value) {}, padding: ThemePadding.pb1, labelColor: ThemeColor.secondary, useBorder: true),
            ])
          ]),
          Gap.gy4,
          Gap.gy4,
          CustomInformationSection(header: "Family Details (Optional)", children: [
            Gap.gy4,
            ThemeTextField.pill(
                borderRadius: ThemeBorderRadius.r3,
                smallSize: true,
                labelText: "Write About Your Family *",
                controller: TextEditingController(),
                maxLines: 5,
                showLabel: false,
                padding: ThemePadding.pb2,
                hintColor: ThemeColor.superRed.withOpacity(.4))
          ]),
          Gap.gy4,
          Gap.gy4,
          Gap.gy4,
          Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "NEXT", bold: true, onTap: () => route(context, const SignUp5PhotoInformation()), color: ThemeColor.superRed)),
          const Progress(progress: 5, outOf: 7),
          Gap.gy6
        ]));
  }
}
