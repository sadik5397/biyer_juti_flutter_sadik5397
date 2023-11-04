import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

class ProfileInformationSubHeader extends StatelessWidget {
  const ProfileInformationSubHeader({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: ThemePadding.py3,
        padding: ThemePadding.px6.copyWith(top: ThemePadding.value, bottom: ThemePadding.value),
        decoration: BoxDecoration(color: ThemeColor.lightRed, borderRadius: ThemeBorderRadius.r4),
        child: Text(label, style: TextStyle(color: ThemeColor.secondary, height: 0, fontSize: 12, fontWeight: FontWeight.bold)));
  }
}
