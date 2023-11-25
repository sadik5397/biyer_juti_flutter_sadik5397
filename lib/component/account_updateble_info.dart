import 'package:biyer_juti/component/hyperlink.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../theme/colors.dart';
import '../theme/padding.dart';

class AccountUpdatableInfo extends StatelessWidget {
  const AccountUpdatableInfo({super.key, required this.label, required this.value, required this.verified, required this.onTapChange});

  final String label;
  final String value;
  final bool verified;
  final VoidCallback onTapChange;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Padding(padding: ThemePadding.p4, child: Text(label, style: TextStyle(color: ThemeColor.navyBlue, fontWeight: FontWeight.bold, fontSize: 14))),
        CircleAvatar(radius: 10, backgroundColor: HexColor(verified ? "#42B77D" : "#FC6161"), child: Icon(verified ? FeatherIcons.check : FeatherIcons.x, color: Colors.white, size: 12))
      ]),
      Row(children: [
        Container(
            decoration: BoxDecoration(color: HexColor("#DFE2E6"), borderRadius: ThemeBorderRadius.r4),
            margin: ThemePadding.p2.copyWith(top: 0, bottom: ThemePadding.value * 6),
            padding: ThemePadding.p2.copyWith(left: ThemePadding.value * 5, right: ThemePadding.value * 5),
            child: Text(value, style: TextStyle(color: ThemeColor.superRed, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 2))),
        if (!verified)
          Padding(
              padding: ThemePadding.pb4,
              child: Hyperlink(
                  borderRadius: ThemeBorderRadius.r2,
                  onTap: onTapChange,
                  child: Padding(padding: ThemePadding.p2, child: Text("Verify", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, color: HexColor("#BA9738")))))),
        Padding(
            padding: ThemePadding.pb4,
            child: Hyperlink(
                borderRadius: ThemeBorderRadius.r2,
                onTap: onTapChange,
                child: Padding(padding: ThemePadding.p2, child: Text("Change", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, color: ThemeColor.navyBlue))))),
      ]),
      Divider(color: ThemeColor.primary.withOpacity(.5), height: 1, thickness: 1, endIndent: ThemePadding.value * 4, indent: ThemePadding.value * 4)
    ]);
  }
}
