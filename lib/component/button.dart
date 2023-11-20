import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import 'hyperlink.dart';

class ThemeButton {
  static Padding pill({EdgeInsets? padding, EdgeInsets? innerPadding, required String title, IconData? icon, required VoidCallback onTap, bool dark = false, bool border = false, Color? color}) {
    return Padding(
        padding: padding ?? ThemePadding.pb4,
        child: Container(
            decoration:
                BoxDecoration(borderRadius: ThemeBorderRadius.r6, color: color ?? (dark ? ThemeColor.secondary : Colors.white), border: Border.all(color: border ? ThemeColor.primary : Colors.transparent)),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: ThemeBorderRadius.r6,
                    onTap: () => onTap.call(),
                    child: Padding(
                        padding: innerPadding ?? ThemePadding.p1 * 2.5,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          if (icon != null) Padding(padding: ThemePadding.pr2, child: Icon(icon, size: 14, color: dark ? Colors.white : ThemeColor.primary)),
                          Text(title, style: TextStyle(fontSize: 14, color: dark ? Colors.white : ThemeColor.primary))
                        ]))))));
  }

  static Expanded expandedPill({EdgeInsets? innerPadding, EdgeInsets? padding, required String title, IconData? icon, required VoidCallback onTap, bool dark = false, bool border = false, Color? color}) {
    return Expanded(child: pill(title: title, padding: padding, onTap: onTap, icon: icon, dark: dark, border: border, innerPadding: innerPadding, color: color));
  }

  static Padding primary(
      {EdgeInsets? padding,
      EdgeInsets? innerPadding,
      BorderRadius? borderRadius,
      required String title,
      IconData? icon,
      required VoidCallback onTap,
      Color? color,
      LinearGradient? gradient,
      bool darkText = false,
      bool border = false}) {
    return Padding(
        padding: padding ?? ThemePadding.pb4,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: borderRadius ?? ThemeBorderRadius.r6,
                gradient: gradient,
                color: gradient == null ? (color ?? ThemeColor.primary) : null,
                border: border ? Border.all(color: ThemeColor.primary, strokeAlign: BorderSide.strokeAlignOutside) : null),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: borderRadius ?? ThemeBorderRadius.r6,
                    onTap: () => onTap.call(),
                    child: Padding(
                        padding: innerPadding ?? ThemePadding.p4,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          if (icon != null) Padding(padding: ThemePadding.pr2, child: Icon(icon, size: 12, color: darkText ? ThemeColor.primary : Colors.white)),
                          Text(title, style: TextStyle(fontSize: 14, color: darkText ? ThemeColor.primary : Colors.white, fontWeight: FontWeight.bold))
                        ]))))));
  }

  static Padding text({required void Function() onTap, String? label, Color? color, FontWeight? weight, double? size}) {
    return Padding(
        padding: ThemePadding.pb1,
        child: Hyperlink(
            inkIntensity: .075,
            onTap: onTap,
            child: Padding(
                padding: ThemePadding.px4.copyWith(top: ThemePadding.value, bottom: ThemePadding.value), child: Text(label ?? "", style: TextStyle(fontSize: size ?? 14, color: color, fontWeight: weight)))));
  }

  static Padding edit({EdgeInsets? padding, required String title, IconData? icon, required VoidCallback onTap, bool dark = false}) {
    return Padding(
        padding: padding ?? ThemePadding.pb4,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: ThemeBorderRadius.r6,
                color: dark ? ThemeColor.secondary : Colors.white,
                border: Border.all(color: ThemeColor.primary, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside)),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: ThemeBorderRadius.r6,
                    onTap: () => onTap.call(),
                    child: Padding(
                        padding: ThemePadding.p1 * 2.5,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          if (icon != null) Padding(padding: ThemePadding.pr2, child: Icon(icon, size: 14, color: dark ? Colors.white : ThemeColor.primary)),
                          Text(title, style: TextStyle(fontSize: 14, color: dark ? Colors.white : ThemeColor.primary, fontWeight: FontWeight.bold))
                        ]))))));
  }
}
