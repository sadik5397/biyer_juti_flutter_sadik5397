import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';

class GiveHeartButtonSmall extends StatefulWidget {
  const GiveHeartButtonSmall({super.key, required this.onTap, required this.hearted, required this.matched});

  final VoidCallback onTap;
  final bool hearted;
  final bool matched;

  @override
  State<GiveHeartButtonSmall> createState() => _GiveHeartButtonSmallState();
}

class _GiveHeartButtonSmallState extends State<GiveHeartButtonSmall> {
  late bool hearted = widget.hearted;
  late bool matched = widget.matched;

  @override
  Widget build(BuildContext context) {
    return matched
        ? Container(
            margin: ThemePadding.py1 / 2,
            width: 135,
            decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, gradient: ThemeGradient.pink),
            child: Padding(
                padding: ThemePadding.p1,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Padding(padding: ThemePadding.pr2, child: const Icon(FeatherIcons.userCheck, size: 16, color: Colors.white)),
                  // ignore: deprecated_member_use
                  Padding(padding: ThemePadding.pr2, child: SvgPicture.asset("assets/svg/match.svg", width: 16, color: Colors.white)),
                  const Text("Matched", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white))
                ])))
        : Container(
            margin: ThemePadding.py1 / 2,
            width: 135,
            decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r5, gradient: hearted ? null : ThemeGradient.red, border: hearted ? Border.all(color: ThemeColor.lightPink, strokeAlign: BorderSide.strokeAlignOutside) : null),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: ThemeBorderRadius.r5,
                    onTap: () {
                      setState(() => hearted = !hearted);
                      widget.onTap.call();
                    },
                    child: Padding(
                        padding: ThemePadding.p1,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          // Padding(padding: ThemePadding.pr2, child: Icon(hearted ? FeatherIcons.heart : FeatherIcons.heart, size: 16, color: hearted ? ThemeColor.lightPink : Colors.white)),
                          // ignore: deprecated_member_use
                          Padding(padding: ThemePadding.pr2, child: SvgPicture.asset("assets/svg/heart_fota.svg", width: 16, color: hearted ? ThemeColor.lightPink : Colors.white)),
                          Text(hearted ? "Heart Given" : "Give Heart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: hearted ? ThemeColor.lightPink : Colors.white))
                        ])))));
  }
}
