import 'package:biyer_juti/component/hyperlink.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/gap.dart';

PopupMenuItem menuItem({required BuildContext context, required String label, required IconData icon, VoidCallback? onTap, required int index}) => PopupMenuItem(
    value: index,
    padding: ThemePadding.px1,
    child: Hyperlink(
        onTap: () {
          routeBack(context);
          if (onTap != null) onTap.call();
        },
        borderRadius: ThemeBorderRadius.r1,
        child: Padding(padding: ThemePadding.p4, child: Row(children: [Icon(icon, size: 16), Gap.gx3, Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: ThemeColor.navyBlue))]))));

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
                child: const Text("About Us", style: TextStyle(fontSize: 12, color: Colors.black45))),
            Gap.gx3,
            const Icon(Icons.circle, color: Colors.black45, size: 8),
            Gap.gx3,
            Hyperlink(
                onTap: () {
                  routeBack(context);
                  toTnC.call();
                },
                borderRadius: ThemeBorderRadius.r1,
                child: const Text("Terms & Conditions", style: TextStyle(fontSize: 12, color: Colors.black45)))
          ]),
          Gap.gy2,
          Row(children: [
            Hyperlink(
                onTap: () {
                  routeBack(context);
                  toPrivacy.call();
                },
                borderRadius: ThemeBorderRadius.r1,
                child: const Text("Privacy Policy", style: TextStyle(fontSize: 12, color: Colors.black45))),
            Gap.gx3,
            const Icon(Icons.circle, color: Colors.black45, size: 8),
            Gap.gx3,
            Hyperlink(
                onTap: () {
                  routeBack(context);
                  toRefund.call();
                },
                borderRadius: ThemeBorderRadius.r1,
                child: const Text("Refund Policy", style: TextStyle(fontSize: 12, color: Colors.black45)))
          ])
        ]));
