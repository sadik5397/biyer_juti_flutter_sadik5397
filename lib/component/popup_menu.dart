import 'package:biyer_juti/component/hyperlink.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/gap.dart';

PopupMenuItem menuItem({required String label, required IconData icon, VoidCallback? onTap}) => PopupMenuItem(
    // onTap: onTap,
    value: 0,
    padding: ThemePadding.px1,
    child: Hyperlink(
        onTap: onTap ?? () {},
        borderRadius: ThemeBorderRadius.r1,
        child: Padding(padding: ThemePadding.p4, child: Row(children: [Icon(icon, size: 16), Gap.gx3, Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: ThemeColor.navyBlue))]))));

// class MenuItem extends StatelessWidget {
//   const MenuItem({super.key, required this.label, required this.icon, this.to});
//
//   final String label;
//   final IconData icon;
//   final Widget? to;
//
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuItem(
//       child: Row(children: [Icon(icon, size: 16), Gap.gx2, Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: ThemeColor.navyBlue))]),
//       onTap: () => route(context, to ?? const Home()),
//     );
//   }
// }
