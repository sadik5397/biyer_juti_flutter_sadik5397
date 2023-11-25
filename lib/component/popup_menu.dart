import 'package:biyer_juti/component/hyperlink.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';
import '../theme/gap.dart';

PopupMenuItem menuItem({required BuildContext context, required String label, required String icon, VoidCallback? onTap, bool premiumFeature = false, bool lastItem = false, required int index}) =>
    PopupMenuItem(
        value: index,
        padding: ThemePadding.px2,
        child: Column(children: [
          Hyperlink(
              onTap: () {
                routeBack(context);
                if (onTap != null) onTap.call();
              },
              borderRadius: ThemeBorderRadius.r3,
              child: Container(
                  decoration: premiumFeature ? BoxDecoration(color: Colors.white, borderRadius: ThemeBorderRadius.r3, border: Border.all(color: ThemeColor.superRed.withOpacity(.15), width: 1)) : null,
                  padding: premiumFeature ? ThemePadding.p1.copyWith(right: 0, left: ThemePadding.value * 2) : EdgeInsets.symmetric(horizontal: ThemePadding.value * 2, vertical: ThemePadding.value * 4),
                  child: Row(children: [
                    SvgPicture.asset("assets/menu/$icon.svg", width: 18),
                    Gap.gx3,
                    premiumFeature
                        ? ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => ThemeGradient.chokmoke.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                            child: Text(label, style: TextStyle(fontWeight: FontWeight.w700, color: ThemeColor.navyBlue)))
                        : Text(label, style: TextStyle(fontWeight: FontWeight.w700, color: ThemeColor.navyBlue)),
                    Expanded(child: SizedBox()),
                    if (premiumFeature) SvgPicture.asset("assets/svg/gold_crown.svg", width: 48, height: 36)
                  ]))),
          if (!lastItem) (premiumFeature ? Gap.gy2 : Divider(height: .5, thickness: .5, color: ThemeColor.superRed.withOpacity(.15), endIndent: ThemePadding.value * 2, indent: ThemePadding.value * 2))
        ]));

PopupMenuItem footerItem({required BuildContext context, required VoidCallback toAbout, required VoidCallback toTnC, required VoidCallback toPrivacy, required VoidCallback toRefund, required int index}) =>
    PopupMenuItem(
        value: index,
        padding: ThemePadding.p4,
        child: Column(children: [
          Row(children: [
            Hyperlink(
                onTap: () {
                  routeBack(context);
                  toAbout.call();
                },
                borderRadius: ThemeBorderRadius.r1,
                child: Text("About Us", style: TextStyle(fontSize: 12, color: ThemeColor.jetBlack))),
            Gap.gx3,
            const Icon(Icons.circle, color: Colors.black45, size: 8),
            Gap.gx3,
            Hyperlink(
                onTap: () {
                  routeBack(context);
                  toTnC.call();
                },
                borderRadius: ThemeBorderRadius.r1,
                child: Text("Terms & Conditions", style: TextStyle(fontSize: 12, color: ThemeColor.jetBlack)))
          ]),
          Gap.gy2,
          Row(children: [
            Hyperlink(
                onTap: () {
                  routeBack(context);
                  toPrivacy.call();
                },
                borderRadius: ThemeBorderRadius.r1,
                child: Text("Privacy Policy", style: TextStyle(fontSize: 12, color: ThemeColor.jetBlack))),
            Gap.gx3,
            const Icon(Icons.circle, color: Colors.black45, size: 8),
            Gap.gx3,
            Hyperlink(
                onTap: () {
                  routeBack(context);
                  toRefund.call();
                },
                borderRadius: ThemeBorderRadius.r1,
                child: Text("Refund Policy", style: TextStyle(fontSize: 12, color: ThemeColor.jetBlack)))
          ])
        ]));
