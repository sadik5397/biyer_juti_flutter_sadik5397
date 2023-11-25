import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'hyperlink.dart';

class ThemeButton {
  static Padding pill(
      {EdgeInsets? padding,
      EdgeInsets? innerPadding,
      required String title,
      TextStyle? textStyle,
      IconData? icon,
      double? elevation,
      double? fontSize,
      String? svgIcon,
      Border? borderStyle,
      required VoidCallback onTap,
      bool dark = false,
      bool transparent = false,
      bool smallSize = false,
      bool boldTitle = false,
      bool border = false,
      bool iconRightSide = false,
      Color? darkColor,
      Color? titleColor,
      Color? color}) {
    return Padding(
        padding: padding ?? ThemePadding.pb4,
        child: Material(
          elevation: elevation ?? 0,
          borderRadius: ThemeBorderRadius.r6,
          color: color ?? (dark ? (darkColor ?? ThemeColor.secondary) : (transparent ? Colors.transparent : Colors.white)),
          child: Container(
              decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, border: borderStyle ?? Border.all(color: border ? ThemeColor.primary : Colors.transparent)),
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: ThemeBorderRadius.r6,
                      onTap: () => onTap.call(),
                      child: Container(
                          padding: innerPadding ?? (smallSize ? ThemePadding.p1 * 1.25 : ThemePadding.p1 * 2.5),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            if (!iconRightSide)
                              if (icon != null)
                                Padding(
                                    padding: ThemePadding.pr2,
                                    child: svgIcon != null
                                        ? SvgPicture.asset(svgIcon, color: dark ? Colors.white : (titleColor ?? ThemeColor.primary))
                                        : Icon(icon, size: 14, color: dark ? Colors.white : (titleColor ?? ThemeColor.primary))),
                            Text(title,
                                style: textStyle ??
                                    TextStyle(fontSize: fontSize ?? 14, color: dark ? Colors.white : (titleColor ?? ThemeColor.primary), fontWeight: boldTitle ? FontWeight.bold : FontWeight.normal)),
                            if (iconRightSide)
                              if (icon != null)
                                Padding(
                                    padding: ThemePadding.pl2,
                                    child: svgIcon != null
                                        ? SvgPicture.asset(svgIcon, color: dark ? Colors.white : (titleColor ?? ThemeColor.primary))
                                        : Icon(icon, size: 14, color: dark ? Colors.white : (titleColor ?? ThemeColor.primary))),
                          ]))))),
        ));
  }

  static Expanded expandedPill(
      {EdgeInsets? innerPadding,
      EdgeInsets? padding,
      required String title,
      IconData? icon,
      required VoidCallback onTap,
      bool dark = false,
      bool boldTitle = false,
      bool iconRightSide = false,
      double? elevation,
      double? fontSize,
      bool border = false,
      Border? borderStyle,
      bool transparent = false,
      bool smallSize = false,
      Color? color,
      Color? titleColor,
      String? svgIcon,
      Color? darkColor}) {
    return Expanded(
        child: pill(
            svgIcon: svgIcon,
            boldTitle: boldTitle,
            smallSize: smallSize,
            titleColor: titleColor,
            fontSize: fontSize,
            borderStyle: borderStyle,
            elevation: elevation,
            iconRightSide: iconRightSide,
            transparent: transparent,
            title: title,
            padding: padding,
            onTap: onTap,
            icon: icon,
            dark: dark,
            border: border,
            innerPadding: innerPadding,
            darkColor: darkColor,
            color: color));
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
      bool bold = true,
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
                          Text(title, style: TextStyle(fontSize: 14, color: darkText ? ThemeColor.primary : Colors.white, fontWeight: bold ? FontWeight.w900 : FontWeight.bold))
                        ]))))));
  }

  static Padding text({required void Function() onTap, String? label, Color? color, FontWeight? weight, double? size, TextDecoration? decoration}) {
    return Padding(
        padding: ThemePadding.pb1,
        child: Hyperlink(
            inkIntensity: .075,
            onTap: onTap,
            child: Padding(
                padding: ThemePadding.px4.copyWith(top: ThemePadding.value, bottom: ThemePadding.value),
                child: Text(label ?? "", style: TextStyle(fontSize: size ?? 14, color: color, fontWeight: weight, decoration: decoration)))));
  }

  static Padding edit({EdgeInsets? padding, required String title, IconData? icon, required VoidCallback onTap, bool dark = false}) {
    return Padding(
        padding: padding ?? ThemePadding.pb4,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: ThemeBorderRadius.r6,
                color: Colors.transparent,
                // color: dark ? ThemeColor.secondary : Colors.white,
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
