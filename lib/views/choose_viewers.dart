import 'package:biyer_juti/component/choose_viwer_selection_section.dart';
import 'package:biyer_juti/component/chosen_viewer_stat.dart';
import 'package:biyer_juti/component/item_chip.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../api/dummy_daya.dart';
import '../component/app_bar.dart';
import '../component/button.dart';
import '../component/dropdown_button.dart';
import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/shadow.dart';
import '../util/global_function.dart';

class ChooseViewers extends StatefulWidget {
  const ChooseViewers({Key? key}) : super(key: key);

  @override
  State<ChooseViewers> createState() => _ChooseViewersState();
}

class _ChooseViewersState extends State<ChooseViewers> {
  RangeValues selectedRange = const RangeValues(22, 32);
  int minimumValue = 18, maximumValue = 90;
  bool showAdvanced = false, lockSearchFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(hideBack: true, premium: true),
        body: ListView(padding: ThemePadding.p4, children: [
          const SectionHeader(label: 'Choose Viewers', topGap: false),
          Padding(
              padding: ThemePadding.px4,
              child: const Text("Do not use these filters if you want all users to view your profile. Using these filters will reduce your chances to get hearts and matches.", textAlign: TextAlign.justify)),
          Padding(
              padding: ThemePadding.p4,
              child: const Text("এই ফিল্টারগুলি ব্যবহার করবেন না, যদি আপনি চান যে সমস্ত ব্যবহারকারী আপনার প্রোফাইল দেখতে পারে। এই ফিল্টার ব্যবহার করে আপনার হার্ট এবং ম্যাচ পাওয়ার সম্ভাবনা কমে যাবে।",
                  textAlign: TextAlign.justify)),
          Container(
              padding: ThemePadding.p6.copyWith(left: ThemePadding.value * 4, right: ThemePadding.value * 4),
              margin: ThemePadding.pb5,
              decoration:
                  BoxDecoration(color: HexColor("CD7B7B"), borderRadius: ThemeBorderRadius.r6, boxShadow: ThemeShadow.primary, border: Border.all(width: 2, color: ThemeColor.secondary.withOpacity(.25))),
              width: double.maxFinite,
              child: Column(children: [
                const Text("Filters", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Gap.gy6,
                Text("Viewer’s Age: ${(selectedRange.start).toInt()}-${(selectedRange.end).toInt()} years", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                RangeSlider(
                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.white.withOpacity(.2)),
                  onChanged: (newRange) => setState(() => selectedRange = newRange),
                  activeColor: Colors.white,
                  min: minimumValue.toDouble(),
                  max: maximumValue.toDouble(),
                  divisions: maximumValue - minimumValue,
                  labels: RangeLabels("${(selectedRange.start).toInt()}", "${(selectedRange.end).toInt()}"),
                  values: selectedRange,
                ),
                Gap.gy4,
                Row(children: [
                  ThemeDropDownButton.expandedSearch(title: "Region", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                  Gap.gx2,
                  ThemeDropDownButton.expandedSearch(title: "Marital Status", options: ["a", "b", "c"], value: "a", onChanged: (value) {})
                ]),
                Gap.gy3,
                const Text("Present Address", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                Gap.gy3,
                Row(children: [
                  ThemeDropDownButton.expandedSearch(title: "Country", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                  Gap.gx2,
                  ThemeDropDownButton.expandedSearch(title: "District", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                ]),
                Gap.gy3,
                ChooseViewerSelectionSection(header: "Hometown", children: List.generate(5, (index) => ItemChip(label: DummyData.randomNameList(5)[index], onDelete: () {})), onAdd: () {}, onReset: () {}),
                Gap.gy6,
                ChooseViewerSelectionSection(header: "Profession", children: List.generate(4, (index) => ItemChip(label: DummyData.randomNameList(4)[index], onDelete: () {})), onAdd: () {}, onReset: () {}),
                Gap.gy6,
                ChooseViewerSelectionSection(header: "Citizenship", children: List.generate(3, (index) => ItemChip(label: DummyData.randomNameList(3)[index], onDelete: () {})), onAdd: () {}, onReset: () {}),
                Gap.gy6,
                ChooseViewerSelectionSection(header: "Education", children: List.generate(6, (index) => ItemChip(label: DummyData.randomNameList(6)[index], onDelete: () {})), onAdd: () {}, onReset: () {}),
                Gap.gy3,
                Padding(
                    padding: ThemePadding.p4,
                    child: const Text(
                        "Upon confirmation, your profile viewers will be limited to the people in the above categories. If you want to get more hearts and matches, Reset these filters and allow all users to view your profile.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white))),
                Padding(
                    padding: ThemePadding.px4,
                    child: const Text(
                        "নিশ্চিতকরণের পরে, আপনার প্রোফাইলের দর্শকরা উপরের বিভাগের লোকেদের মধ্যে সীমাবদ্ধ থাকবে। আপনি যদি আরও হৃদয় এবং ম্যাচ পেতে চান, এই ফিল্টারগুলি রিসেট করুন এবং সমস্ত ব্যবহারকারীদের আপনার প্রোফাইল দেখার অনুমতি দিন৷",
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white))),
                Gap.gy4,
                Row(children: [
                  ThemeButton.expandedPill(title: "Reset All", onTap: () {}, icon: FeatherIcons.refreshCw, padding: ThemePadding.none),
                  Gap.gx2,
                  ThemeButton.expandedPill(title: "Confirm Filter", onTap: () {}, icon: FeatherIcons.filter, dark: true, padding: ThemePadding.none)
                ]),
              ])),
          ChosenViewerStat(foundProfileCount: randomNumber(9999)),
        ]));
  }
}
