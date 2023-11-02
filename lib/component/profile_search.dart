import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../theme/shadow.dart';
import 'dropdown_button.dart';

class ProfileSearch extends StatefulWidget {
  const ProfileSearch({Key? key}) : super(key: key);

  @override
  State<ProfileSearch> createState() => _ProfileSearchState();
}

class _ProfileSearchState extends State<ProfileSearch> {
  RangeValues selectedRange = const RangeValues(22, 32);
  int minimumValue = 18;
  int maximumValue = 90;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: ThemePadding.p5,
        margin: ThemePadding.pb5,
        decoration: BoxDecoration(gradient: ThemeGradient.primary, borderRadius: ThemeBorderRadius.r6, boxShadow: ThemeShadow.primary),
        width: double.maxFinite,
        child: Column(children: [
          const Text("Find Your Life Partner", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(
              padding: ThemePadding.p6.copyWith(bottom: ThemePadding.value),
              child: Text("Preferred Age: ${(selectedRange.start).toInt()}-${(selectedRange.end).toInt()} years", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))),
          Padding(
            padding: ThemePadding.pb4,
            child: RangeSlider(
              overlayColor: MaterialStateColor.resolveWith((states) => Colors.white.withOpacity(.2)),
              onChanged: (newRange) => setState(() => selectedRange = newRange),
              activeColor: Colors.white,
              min: minimumValue.toDouble(),
              max: maximumValue.toDouble(),
              divisions: maximumValue - minimumValue,
              labels: RangeLabels("${(selectedRange.start).toInt()}", "${(selectedRange.end).toInt()}"),
              values: selectedRange,
            ),
          ),
          Row(children: [
            ThemeDropDownButton.expandedSearch(title: "Region", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
            Gap.gx2,
            ThemeDropDownButton.expandedSearch(title: "Marital Status", options: ["a", "b", "c"], value: "a", onChanged: (value) {})
          ]),
          Row(children: [
            ThemeDropDownButton.expandedSearch(title: "Region", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
            Gap.gx2,
            ThemeDropDownButton.expandedSearch(title: "Marital Status", options: ["a", "b", "c"], value: "a", onChanged: (value) {})
          ]),
        ]));
  }
}
