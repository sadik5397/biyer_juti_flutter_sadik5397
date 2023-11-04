import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.label, this.topGap = true});

  final String label;
  final bool topGap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: ThemePadding.p4.copyWith(top: topGap ? ThemePadding.value * 12 : ThemePadding.value * 4),
        child: Text(label, style: TextStyle(color: ThemeColor.secondary, fontWeight: FontWeight.bold, fontSize: 24)));
  }
}
