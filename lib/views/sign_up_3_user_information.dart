import 'package:biyer_juti/api/dummy_daya.dart';
import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/progress.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/sign_up_4_family_information.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../component/custom_information_section.dart';
import '../component/dropdown_button.dart';
import '../component/text_field.dart';

class SignUp3UserInformation extends StatefulWidget {
  const SignUp3UserInformation({super.key});

  @override
  State<SignUp3UserInformation> createState() => _SignUp3UserInformationState();
}

class _SignUp3UserInformationState extends State<SignUp3UserInformation> {
  int educationSet = 1, professionSet = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        appBar: ThemeAppBar.blank(context: context, useNewAppBar: true),
        body: ListView(padding: ThemePadding.px6, children: [
          Image.asset("assets/logo-wide.png", height: 75),
          SectionHeader(label: "User Information", topGap: false, color: ThemeColor.primary),
          Gap.gy2,
          CustomInformationSection(padding: ThemePadding.pb4 * 2, header: "Educational Qualification *", children: [
            Gap.gy4,
            Column(
                children: List.generate(
                    educationSet,
                    (index) => Column(children: [
                          Row(children: [
                            ThemeDropDownButton.expandedSearch(padding: ThemePadding.pb2, title: "Your Degree", options: DummyData.randomNames, value: null, onChanged: (value) {}, labelColor: ThemeColor.secondary, iconRightSide: true),
                            Gap.gx2,
                            ThemeDropDownButton.expandedSearch(padding: ThemePadding.pb2, title: "Passing Year", options: DummyData.randomNames, value: null, onChanged: (value) {}, labelColor: ThemeColor.secondary, iconRightSide: true),
                          ]),
                          ThemeTextField.pill(padding: ThemePadding.pb2, labelText: "Write Subject Here *", controller: TextEditingController(), smallSize: true, showLabel: false, hintColor: ThemeColor.superRed.withOpacity(.4)),
                          ThemeTextField.pill(padding: ThemePadding.pb2, labelText: "Institution Name *", controller: TextEditingController(), smallSize: true, showLabel: false, hintColor: ThemeColor.superRed.withOpacity(.4)),
                          // ThemeDropDownButton.pill(padding: ThemePadding.pb2, useSearch: true, title: "Institution", value: null, options: DummyData.randomNames, onChanged: (value) {}, labelColor: ThemeColor.secondary,iconRightSide:true),
                          ThemeDropDownButton.pill(padding: ThemePadding.pb2, useSearch: true, title: "Country", value: null, options: DummyData.randomNames, onChanged: (value) {}, labelColor: ThemeColor.secondary, iconRightSide: true),
                          Gap.gy2
                        ]))),
            ThemeButton.pill(title: "Add Another", onTap: () => setState(() => educationSet++), icon: FeatherIcons.plusCircle, dark: true, padding: ThemePadding.px6 * 2, color: ThemeColor.primary, smallSize: true, iconRightSide: true)
          ]),
          CustomInformationSection(padding: ThemePadding.pb4 * 2, header: "Profession *", children: [
            Gap.gy4,
            Column(
                children: List.generate(
                    professionSet,
                    (index) => Column(children: [
                          ThemeDropDownButton.pill(title: "Industry Category *", options: DummyData.randomNames, value: null, dark: true, onChanged: (value) {}, padding: ThemePadding.px6),
                          Gap.gy2,
                      ThemeDropDownButton.pill(padding: ThemePadding.pb2, useSearch: true, title: "Designation *", value: null, options: DummyData.randomNames, onChanged: (value) {}, labelColor: ThemeColor.secondary,iconRightSide:true),
                          // ThemeDropDownButton.pill(padding: ThemePadding.pb2, useSearch: true, title: "Designation *", value: null, options: DummyData.randomNames, onChanged: (value) {}, labelColor: ThemeColor.secondary,iconRightSide:true),
                          // ThemeDropDownButton.pill(padding: ThemePadding.pb2, useSearch: true, title: "Organization *", value: null, options: DummyData.randomNames, onChanged: (value) {}, labelColor: ThemeColor.secondary,iconRightSide:true),
                      ThemeTextField.pill(padding: ThemePadding.pb2, labelText: "Organization *", controller: TextEditingController(), smallSize: true, showLabel: false, hintColor: ThemeColor.superRed.withOpacity(.4)),
                      Gap.gy2
                        ]))),
            ThemeButton.pill(smallSize: true, iconRightSide: true, title: "Add Another", onTap: () => setState(() => professionSet++), icon: FeatherIcons.plusCircle, dark: true, padding: ThemePadding.px6 * 2, color: ThemeColor.primary)
          ]),
          CustomInformationSection(padding: ThemePadding.pb4 * 2, innerPadding: ThemePadding.p4, header: "Present Address *", children: [
            Gap.gy4,
            ThemeDropDownButton.pill(padding: ThemePadding.pb2, useSearch: true, title: "Country *", value: null, options: DummyData.randomNames, onChanged: (value) {}, labelColor: ThemeColor.secondary, iconRightSide: true),
            ThemeTextField.pill(padding: ThemePadding.pb2, smallSize: true, hintColor: ThemeColor.superRed.withOpacity(.4), showLabel: false, labelText: "District *", controller: TextEditingController()),
            ThemeTextField.pill(padding: ThemePadding.pb2, smallSize: true, hintColor: ThemeColor.superRed.withOpacity(.4), showLabel: false, labelText: "Area *", controller: TextEditingController())
          ]),
          CustomInformationSection(padding: ThemePadding.pb4 * 2, header: "Permanent Address *", children: [
            Gap.gy4,
            ThemeDropDownButton.pill(padding: ThemePadding.pb2, useSearch: true, title: "Country *", value: null, options: DummyData.randomNames, onChanged: (value) {}, labelColor: ThemeColor.secondary, iconRightSide: true),
            ThemeTextField.pill(padding: ThemePadding.pb2, smallSize: true, hintColor: ThemeColor.superRed.withOpacity(.4), showLabel: false, labelText: "District *", controller: TextEditingController()),
            ThemeTextField.pill(padding: ThemePadding.pb2, smallSize: true, hintColor: ThemeColor.superRed.withOpacity(.4), showLabel: false, labelText: "Area *", controller: TextEditingController())
          ]),
          CustomInformationSection(
              padding: ThemePadding.pb4 * 2,
              header: "Bio *",
              children: [Gap.gy4, ThemeTextField.pill(borderRadius: ThemeBorderRadius.r3, smallSize: true, labelText: "Write About Yourself *", controller: TextEditingController(), maxLines: 5, showLabel: false, padding: ThemePadding.pb2, hintColor: ThemeColor.superRed.withOpacity(.4))]),
          Gap.gy4,
          Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "NEXT", bold: true, onTap: () => route(context, const SignUp4FamilyInformation()), color: ThemeColor.superRed)),
          const Progress(progress: 4, outOf: 7),
          Gap.gy6
        ]));
  }
}
