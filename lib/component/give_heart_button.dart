import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colors.dart';

class GiveHeartButton extends StatefulWidget {
  const GiveHeartButton({super.key, required this.onTap, required this.hearted, required this.matched});

  final VoidCallback onTap;
  final bool hearted;
  final bool matched;

  @override
  State<GiveHeartButton> createState() => _GiveHeartButtonState();
}

class _GiveHeartButtonState extends State<GiveHeartButton> {
  late bool hearted = widget.hearted;
  late bool matched = widget.matched;

  @override
  Widget build(BuildContext context) {
    return matched
        ? Container(
            decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, gradient: ThemeGradient.pink),
            child: Padding(
                padding: ThemePadding.p3,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Padding(padding: ThemePadding.pr2, child: const Icon(FeatherIcons.userCheck, size: 21, color: Colors.white)),
                  Padding(padding: ThemePadding.pr2, child: SvgPicture.asset("assets/svg/match.svg", width: 21, color: Colors.white)),
                  const Text("Matched", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white))
                ])))
        : Container(
            decoration: BoxDecoration(
                borderRadius: ThemeBorderRadius.r6, gradient: hearted ? null : ThemeGradient.red, border: hearted ? Border.all(color: ThemeColor.lightPink, strokeAlign: BorderSide.strokeAlignOutside) : null),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: ThemeBorderRadius.r6,
                    onTap: () {
                      setState(() => hearted = !hearted);
                      widget.onTap.call();
                    },
                    child: Padding(
                        padding: ThemePadding.p3,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          // Padding(padding: ThemePadding.pr2, child: Icon(hearted ? FeatherIcons.heart : FeatherIcons.heart, size: 21, color: hearted ? ThemeColor.lightPink : Colors.white)),
                          Padding(padding: ThemePadding.pr2, child: SvgPicture.asset("assets/svg/heart_fota.svg", width: 21, color: hearted ? ThemeColor.lightPink : Colors.white)),
                          Text(hearted ? "Heart Given" : "Give Heart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: hearted ? ThemeColor.lightPink : Colors.white))
                        ])))));
  }
}
