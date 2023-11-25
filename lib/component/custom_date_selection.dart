import 'package:biyer_juti/api/dummy_daya.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/global_function.dart';
import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import 'dropdown_button.dart';

class CustomDateSelection extends StatelessWidget {
  const CustomDateSelection({super.key, required this.label, required this.transparent});

  final String label;
  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          alignment: Alignment.center,
          margin: ThemePadding.py2.copyWith(bottom: ThemePadding.value * 4),
          decoration: BoxDecoration(border: Border.all(color: ThemeColor.primary), borderRadius: ThemeBorderRadius.r4, color: transparent ? Colors.transparent : Colors.white),
          height: 55,
          child: Row(children: [
            Gap.gx2,
            ThemeDropDownButton.expandedSearch(
                dark: true,
                padding: EdgeInsets.symmetric(vertical: ThemePadding.value * 2.8),
                title: "Day",
                options: List.generate(31, (i) => i.toString()),
                value: randomNumber(31).toString(),
                onChanged: (value) {}),
            Gap.gx2,
            ThemeDropDownButton.expandedSearch(
                dark: true,
                padding: EdgeInsets.symmetric(vertical: ThemePadding.value * 2.8),
                title: "Month",
                options: DummyData.months,
                showLabelWhenSelected: false,
                value: DummyData.months[randomNumber(DummyData.months.length)],
                onChanged: (value) {}),
            Gap.gx2,
            ThemeDropDownButton.expandedSearch(
                dark: true,
                padding: EdgeInsets.symmetric(vertical: ThemePadding.value * 2.8),
                title: "Year",
                showLabelWhenSelected: false,
                options: List.generate(100, (index) => (DateTime.now().year - index).toString()),
                value: List.generate(100, (index) => (DateTime.now().year - index).toString())[randomNumber(100)],
                onChanged: (value) {}),
            Gap.gx2
          ])),
      Container(
          padding: ThemePadding.px2, margin: ThemePadding.px2, color: ThemeColor.lightPinkBackground, child: Text(label, style: TextStyle(fontSize: 12, color: ThemeColor.primary, fontWeight: FontWeight.bold)))
    ]);
  }
}
