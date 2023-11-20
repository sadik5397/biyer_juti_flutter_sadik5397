import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../theme/colors.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({super.key, required this.options, this.label});

  final List<String> options;
  final String? label;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool selectedLeft = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) Padding(padding: ThemePadding.pb4, child: Text(widget.label!, style: TextStyle(color: ThemeColor.navyBlue))),
        Container(
            margin: ThemePadding.pb4 * 2,
            decoration: BoxDecoration(gradient: ThemeGradient.secondary, borderRadius: ThemeBorderRadius.r4),
            child: Container(
                margin: ThemePadding.p1 / 2,
                decoration: BoxDecoration(color: HexColor("#fffbfe"), borderRadius: ThemeBorderRadius.r4 / 1.25),
                child: Column(children: [
                  ThemeButton.primary(
                      icon: selectedLeft ? FeatherIcons.checkCircle : null,
                      title: widget.options[0],
                      onTap: () => setState(() => selectedLeft = true),
                      border: false,
                      padding: ThemePadding.p6,
                      borderRadius: ThemeBorderRadius.r4,
                      innerPadding: ThemePadding.p3,
                      darkText: !selectedLeft,
                      color: selectedLeft ? null : HexColor("#DFE2E6")),
                  if (widget.options.length > 1)
                    ThemeButton.primary(
                        icon: !selectedLeft ? FeatherIcons.checkCircle : null,
                        title: widget.options[1],
                        onTap: () => setState(() => selectedLeft = false),
                        border: false,
                        borderRadius: ThemeBorderRadius.r4,
                        padding: ThemePadding.p6.copyWith(top: 0),
                        innerPadding: ThemePadding.p3,
                        darkText: selectedLeft,
                        color: !selectedLeft ? null : HexColor("#DFE2E6"))
                ]))),
      ],
    );
  }
}
