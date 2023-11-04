import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';

class Progress extends StatelessWidget {
  const Progress({super.key, required this.progress, required this.outOf});

  final double progress;
  final double outOf;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: ThemePadding.py4,
          child: ClipRRect(
              borderRadius: ThemeBorderRadius.r1, child: LinearProgressIndicator(color: ThemeColor.primary, backgroundColor: ThemeColor.primary.withOpacity(.25), value: progress / outOf, minHeight: 6))),
      Text("${progress.toInt()} of ${outOf.toInt()} Completed", style: TextStyle(color: ThemeColor.secondary, fontWeight: FontWeight.normal, fontSize: 12))
    ]);
  }
}
