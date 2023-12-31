import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.label, this.topGap = true, this.fontSize = 24, this.color});

  final String label;
  final bool topGap;
  final double fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: ThemePadding.p4.copyWith(top: topGap ? ThemePadding.value * 12 : ThemePadding.value * 4),
        child: Text(label, textAlign: TextAlign.center, style: TextStyle(color: color ?? ThemeColor.secondary, fontWeight: FontWeight.bold, fontSize: fontSize)));
  }
}
