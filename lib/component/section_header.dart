import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 12), child: Text(label, style: TextStyle(color: ThemeColor.secondary, fontWeight: FontWeight.bold, fontSize: 24)));
  }
}
