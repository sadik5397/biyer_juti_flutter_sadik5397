import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';

class CustomGenderSelection extends StatefulWidget {
  const CustomGenderSelection({super.key, required this.label});

  final String label;

  @override
  State<CustomGenderSelection> createState() => _CustomGenderSelectionState();
}

class _CustomGenderSelectionState extends State<CustomGenderSelection> {
  bool selectedMale = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          alignment: Alignment.center,
          margin: ThemePadding.py2.copyWith(bottom: ThemePadding.value * 4),
          decoration: BoxDecoration(border: Border.all(color: ThemeColor.primary), borderRadius: ThemeBorderRadius.r4, color: Colors.white),
          height: 55,
          child: Row(children: [
            ThemeButton.expandedPill(title: "Male", onTap: () => setState(() => selectedMale = true), border: !selectedMale, padding: ThemePadding.p1 * 2.5, innerPadding: ThemePadding.p1, dark: selectedMale),
            ThemeButton.expandedPill(title: "Female", onTap: () => setState(() => selectedMale = false), border: selectedMale, padding: ThemePadding.p1 * 2.5, innerPadding: ThemePadding.p1, dark: !selectedMale)
          ])),
      Container(
          padding: ThemePadding.px2,
          margin: ThemePadding.px2,
          color: ThemeColor.lightPinkBackground,
          child: Text(widget.label, style: TextStyle(fontSize: 12, color: ThemeColor.primary, fontWeight: FontWeight.bold)))
    ]);
  }
}
