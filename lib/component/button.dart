import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThemeButton {
  static Padding pill({EdgeInsets? padding, required String title, IconData? icon, required VoidCallback onTap, bool dark = false}) {
    return Padding(
        padding: padding ?? ThemePadding.pb4,
        child: Container(
            decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, color: dark ? ThemeColor.secondary : Colors.white),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: ThemeBorderRadius.r6,
                    onTap: () => onTap.call(),
                    child: Padding(
                        padding: ThemePadding.p3,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          if (icon != null) Padding(padding: ThemePadding.pr2, child: FaIcon(icon, size: 12, color: dark ? Colors.white : ThemeColor.primary)),
                          Text(title, style: TextStyle(fontSize: 14, color: dark ? Colors.white : ThemeColor.primary))
                        ]))))));
  }

  static Expanded expandedPill({EdgeInsets? padding, required String title, IconData? icon, required VoidCallback onTap, bool dark = false}) {
    return Expanded(child: pill(title: title, padding: padding, onTap: onTap, icon: icon, dark: dark));
  }
}
