import 'package:biyer_juti/component/bottom_navigation.dart';
import 'package:biyer_juti/component/heart_stat.dart';
import 'package:biyer_juti/component/pagination.dart';
import 'package:biyer_juti/component/profile_card.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/component/text_field.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

enum SampleItem { itemOne, itemTwo, itemThree }

class _ChooseViewersState extends State<ChooseViewers> {
  RangeValues selectedRange = const RangeValues(22, 32);
  int minimumValue = 18, maximumValue = 90;
  bool showAdvanced = false, lockSearchFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const ThemeNavigation(currentIndex: 0),
        appBar: ThemeAppBar.primary(hideBack: true, premium: true),
        body: ListView(padding: ThemePadding.p4, children: [
          const SectionHeader(label: 'Choose Viewers', topGap: false),
          Padding(
            padding: ThemePadding.px4,
            child: const Text("Do not use these filters if you want all users to view your profile. Using these filters will reduce your chances to get hearts and matches.", textAlign: TextAlign.justify)
          ),
          Padding(
            padding: ThemePadding.p4,
            child: const Text("এই ফিল্টারগুলি ব্যবহার করবেন না, যদি আপনি চান যে সমস্ত ব্যবহারকারী আপনার প্রোফাইল দেখতে পারে। এই ফিল্টার ব্যবহার করে আপনার হার্ট এবং ম্যাচ পাওয়ার সম্ভাবনা কমে যাবে।", textAlign: TextAlign.justify)
          ),
          Container(
              padding: ThemePadding.p6.copyWith(left: ThemePadding.value * 4, right: ThemePadding.value * 4),
              margin: ThemePadding.pb5,
              decoration: BoxDecoration(gradient: ThemeGradient.primary, borderRadius: ThemeBorderRadius.r6, boxShadow: ThemeShadow.primary, border: Border.all(width: 2, color: Colors.black.withOpacity(.1))),
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
                Row(children: [
                  ThemeButton.expandedPill(title: "Reset Search", onTap: () {}, icon: FeatherIcons.refreshCw),
                  Gap.gx2,
                  ThemeButton.expandedPill(title: "Search", onTap: () {}, icon: FeatherIcons.search, dark: true),
                ]),

              ThemeTextField.pill(labelText: "Search by Profile ID", controller: TextEditingController(), showLabel: false, centerAlign: true),
              Row(children: [
                ThemeDropDownButton.expandedSearch(title: "Citizenship", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                Gap.gx2,
                ThemeDropDownButton.expandedSearch(title: "Education", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
              ]),
              Row(children: [
                ThemeDropDownButton.expandedSearch(title: "Min. Height", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                Gap.gx2,
                ThemeDropDownButton.expandedSearch(title: "Profession", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
              ]),
              Row(children: [
                ThemeDropDownButton.expandedSearch(title: "Min. Height", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                Gap.gx2,
                ThemeDropDownButton.expandedSearch(title: "Profession", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
              ]),
              ThemeDropDownButton.search(title: "Hometown", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
              const Text("Present Address", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              Gap.gy3,
              Row(children: [
                ThemeDropDownButton.expandedSearch(title: "Country", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                Gap.gx2,
                ThemeDropDownButton.expandedSearch(title: "District", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
              ]),
              Row(children: [
                ThemeButton.expandedPill(title: "Reset Search", onTap: () {}, icon: FeatherIcons.refreshCw),
                Gap.gx2,
                ThemeButton.expandedPill(title: "Adv. Search", onTap: () {}, icon: FeatherIcons.search, dark: true),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Lock Search Filter", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                Gap.gx2,
                Switch(value: lockSearchFilter, activeColor: ThemeColor.secondary, onChanged: (value) => setState(() => lockSearchFilter = !lockSearchFilter))
              ]),
              ])),
          ...List.generate(
              40,
              (index) => ProfileCard(
                  id: index,
                  online: index % 3 == 0,
                  premium: index % 4 == 0,
                  hearted: index % 2 == 0,
                  match: index % 5 == 0,
                  requestState: DummyData.currentRequestState[randomNumber(DummyData.currentRequestState.length)])),
          const Pagination(),
        ]));
  }
}
