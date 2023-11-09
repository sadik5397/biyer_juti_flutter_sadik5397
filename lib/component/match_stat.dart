import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

class MatchStat extends StatelessWidget {
  const MatchStat({super.key, required this.match, required this.heartGiven});

  final int match;
  final int heartGiven;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ThemePadding.pb6,
        padding: ThemePadding.p6 * 1.25,
        decoration: BoxDecoration(gradient: ThemeGradient.primary, borderRadius: ThemeBorderRadius.r6),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(children: [
            const Text("Hearts\nGiven", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
            Gap.gy3,
            ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => ThemeGradient.gold.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                child: Text(heartGiven.toString(), style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)))
          ]),
          Container(width: 1, height: 108, color: Colors.white),
          Column(children: [
            const Text("Total\nMatch", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
            Gap.gy4,
            ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => ThemeGradient.gold.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                child: Text(match.toString(), style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)))
          ])
        ]));
  }
}