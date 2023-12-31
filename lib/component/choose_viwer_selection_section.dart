import 'package:dotted_border/dotted_border.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import 'button.dart';

class ChooseViewerSelectionSection extends StatelessWidget {
  const ChooseViewerSelectionSection({super.key, required this.header, required this.children, required this.onAdd, required this.onReset});

  final String header;
  final VoidCallback onAdd;
  final VoidCallback onReset;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DottedBorder(
          borderPadding: ThemePadding.pt3,
          borderType: BorderType.RRect,
          color: Colors.white,
          strokeCap: StrokeCap.round,
          dashPattern: const [2, 4],
          radius: Radius.circular(ThemeBorderRadius.value * 4),
          padding: ThemePadding.p4,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gap.gy4,
            Gap.gy4,
            Wrap(spacing: ThemePadding.value * 2, runSpacing: ThemePadding.value * 2, children: children),
            Gap.gy4,
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.75,
                child: Row(children: [
                  ThemeButton.expandedPill(
                      title: "Reset",
                      onTap: onReset,
                      icon: FeatherIcons.refreshCw,
                      padding: ThemePadding.none,
                      smallSize: true,
                      titleColor: ThemeColor.jetBlack,
                      color: Colors.white.withOpacity(.75),
                      fontSize: 12,
                      iconRightSide: true,
                      svgIcon: "assets/svg/refresh.svg"),
                  Gap.gx2,
                  ThemeButton.expandedPill(
                      title: header,
                      onTap: onAdd,
                      icon: FeatherIcons.plus,
                      color: Colors.white,
                      padding: ThemePadding.none,
                      smallSize: true,
                      fontSize: 12,
                      iconRightSide: true,
                      titleColor: ThemeColor.jetBlack,
                      boldTitle: true)
                ]),
              ),
            )
          ])),
      Container(
          padding: ThemePadding.p1.copyWith(left: ThemePadding.value * 4, right: ThemePadding.value * 4),
          margin: ThemePadding.pl2,
          decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, color: Colors.white),
          child: Text("Selected $header", style: TextStyle(fontSize: 12, color: ThemeColor.jetBlack, fontWeight: FontWeight.bold)))
    ]);
  }
}
