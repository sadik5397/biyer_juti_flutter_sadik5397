import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';

class CustomToggleSelection extends StatefulWidget {
  const CustomToggleSelection({super.key, required this.label, required this.options});

  final String label;
  final List<String> options;

  @override
  State<CustomToggleSelection> createState() => _CustomToggleSelectionState();
}

class _CustomToggleSelectionState extends State<CustomToggleSelection> {
  bool selectedLeft = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          alignment: Alignment.center,
          margin: ThemePadding.py2.copyWith(bottom: ThemePadding.value * 4),
          decoration: BoxDecoration(border: Border.all(color: ThemeColor.primary), borderRadius: ThemeBorderRadius.r4, color: Colors.white),
          height: 55,
          child: Row(children: [
            ThemeButton.expandedPill(
                title: widget.options[0], onTap: () => setState(() => selectedLeft = true), border: !selectedLeft, padding: ThemePadding.p1 * 2.5, innerPadding: ThemePadding.p1, dark: selectedLeft),
            if (widget.options.length > 1)
              ThemeButton.expandedPill(
                  title: widget.options[1], onTap: () => setState(() => selectedLeft = false), border: selectedLeft, padding: ThemePadding.p1 * 2.5, innerPadding: ThemePadding.p1, dark: !selectedLeft)
          ])),
      Container(
          padding: ThemePadding.px2,
          margin: ThemePadding.px2,
          color: ThemeColor.lightPinkBackground,
          child: Text(widget.label, style: TextStyle(fontSize: 12, color: ThemeColor.primary, fontWeight: FontWeight.bold)))
    ]);
  }
}
