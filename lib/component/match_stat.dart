import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MatchStat extends StatelessWidget {
  const MatchStat({super.key, required this.match, required this.heartRcvd});

  final int match;
  final int heartRcvd;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: ThemePadding.pb6,
        child: Material(
            elevation: 30,
            shadowColor: Colors.black.withOpacity(.35),
            borderRadius: ThemeBorderRadius.r5 * 2,
            child: Container(
                padding: ThemePadding.p6 * 1.25,
                decoration: BoxDecoration(gradient: ThemeGradient.primary, borderRadius: ThemeBorderRadius.r5 * 2, border: Border.all(color: HexColor("#da6364"), width: 2)),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Column(children: [
                    const Text("Hearts\nReceived", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                    Gap.gy3,
                    ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => ThemeGradient.gold.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: Text(heartRcvd.toString(), style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)))
                  ]),
                  Container(width: 1, height: 108, color: Colors.white),
                  Column(children: [
                    const Text("Total\nMatched", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                    Gap.gy4,
                    ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => ThemeGradient.gold.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: Text(match.toString(), style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)))
                  ])
                ]))));
  }
}
