import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';
import 'hyperlink.dart';

class BasicNavigationButton extends StatelessWidget {
  const BasicNavigationButton({super.key, required this.label, this.lastItem = false, this.onTap});

  final String label;
  final bool lastItem;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Hyperlink(
          onTap: onTap ?? () {},
          borderRadius: ThemeBorderRadius.r2,
          child: Padding(padding: ThemePadding.p4, child: Text(label, style: TextStyle(color: ThemeColor.navyBlue, fontWeight: FontWeight.bold, fontSize: 17)))),
      if (!lastItem) Divider(color: ThemeColor.primary.withOpacity(.5), height: 1, thickness: 1, endIndent: ThemePadding.value * 4, indent: ThemePadding.value * 4)
    ]);
  }
}
