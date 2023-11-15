import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

class ChosenViewerStat extends StatelessWidget {
  const ChosenViewerStat({super.key, required this.foundProfileCount});

  final int foundProfileCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ThemePadding.pb6,
        padding: ThemePadding.p2,
        decoration: BoxDecoration(color: ThemeColor.lightPinkBackground, borderRadius: ThemeBorderRadius.r6, border: Border.all(color: ThemeColor.primary)),
        child: Column(children: [
          Padding(
            padding: ThemePadding.py3,
            child: Text("The following number of users can view your profile", style: TextStyle(color: ThemeColor.secondary, fontSize: 12, fontWeight: FontWeight.w500), textAlign: TextAlign.center)
          ),
          ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => ThemeGradient.secondary.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(foundProfileCount.toString(), style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900)))
        ]));
  }
}