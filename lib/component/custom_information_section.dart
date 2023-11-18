import 'package:biyer_juti/theme/padding.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';

class CustomInformationSection extends StatelessWidget {
  const CustomInformationSection({super.key, required this.header, required this.children});

  final String header;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DottedBorder(
          borderPadding: ThemePadding.pt2,
          borderType: BorderType.RRect,
          color: ThemeColor.primary,
          strokeCap: StrokeCap.round,
          dashPattern: const [2, 0],
          radius: Radius.circular(ThemeBorderRadius.value * 4),
          padding: ThemePadding.p4,
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: children)),
      Container(
          padding: ThemePadding.px1, margin: ThemePadding.px3, color: ThemeColor.lightPinkBackground, child: Text(header, style: TextStyle(fontSize: 12, color: ThemeColor.primary, fontWeight: FontWeight.bold)))
    ]);
  }
}
