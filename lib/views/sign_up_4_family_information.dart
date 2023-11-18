import 'package:biyer_juti/api/dummy_daya.dart';
import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/progress.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../component/custom_information_section.dart';
import '../component/dropdown_button.dart';
import '../component/text_field.dart';

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
        appBar: ThemeAppBar.blank,
        body: ListView(padding: ThemePadding.px6, children: [
          Image.asset("assets/logo-wide.png", height: 75),
          const SectionHeader(label: "User Information", topGap: false),
          Gap.gy2,
          CustomInformationSection(header: "Educational Qualification *", children: [
            Gap.gy4,
            Row(children: [
              ThemeDropDownButton.expandedSearch(title: "Your Degree *", options: DummyData.randomNames, value: null, onChanged: (value) {}),
              Gap.gx3,
              ThemeDropDownButton.expandedSearch(title: "Passing Year", options: DummyData.randomNames, value: null, onChanged: (value) {}),
            ]),
            ThemeTextField.pill(labelText: "Subject *", controller: TextEditingController()),
            ThemeTextField.pill(labelText: "Institution *", controller: TextEditingController()),
            ThemeTextField.pill(labelText: "Country *", controller: TextEditingController()),
            ThemeButton.pill(title: "Add Another", onTap: () {}, icon: FeatherIcons.plus, dark: true, padding: ThemePadding.px6 * 2, color: ThemeColor.primary)
          ]),
          Gap.gy4,
          Gap.gy4,
          CustomInformationSection(header: "Profession *", children: [
            Gap.gy4,
            ThemeDropDownButton.search(title: "Industry Category *", options: DummyData.randomNames, value: null, dark: true, onChanged: (value) {}, padding: ThemePadding.px6),
            Gap.gy4,
            ThemeTextField.pill(labelText: "Designation *", controller: TextEditingController()),
            ThemeTextField.pill(labelText: "Organization’s Name *", controller: TextEditingController()),
            ThemeButton.pill(title: "Add Another", onTap: () {}, icon: FeatherIcons.plus, dark: true, padding: ThemePadding.px6 * 2, color: ThemeColor.primary)
          ]),
          Gap.gy4,
          Gap.gy4,
          CustomInformationSection(header: "Bio *", children: [
            Gap.gy4,
            ThemeTextField.pill(labelText: "Write About Yourself *", controller: TextEditingController(), maxLines: 5, showLabel: false),
          ]),
          Gap.gy4,
          Gap.gy4,
          Gap.gy4,
          Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "NEXT", onTap: () {}, color: ThemeColor.primary)),
          const Progress(progress: 4, outOf: 6),
          Gap.gy6
        ]));
  }
}
