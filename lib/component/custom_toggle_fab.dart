import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';

class CustomToggleFab extends StatefulWidget {
  const CustomToggleFab({super.key, required this.options, this.transparent = false});

  final bool transparent;
  final List<String> options;

  @override
  State<CustomToggleFab> createState() => _CustomToggleFabState();
}

class _CustomToggleFabState extends State<CustomToggleFab> {
  bool selectedLeft = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: ThemeBorderRadius.r6,
      color: widget.transparent ? Colors.transparent : Colors.white,
      child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: 40,
          child: Row(children: [
            ThemeButton.expandedPill(
                darkColor: ThemeColor.jetBlack,
                transparent: true,
                title: widget.options[0],
                onTap: () => setState(() => selectedLeft = true),
                padding: ThemePadding.p1,
                innerPadding: ThemePadding.p1,
                dark: selectedLeft),
            if (widget.options.length > 1)
              ThemeButton.expandedPill(
                  darkColor: ThemeColor.jetBlack,
                  transparent: true,
                  title: widget.options[1],
                  onTap: () => setState(() => selectedLeft = false),
                  padding: ThemePadding.p1,
                  innerPadding: ThemePadding.p1,
                  dark: !selectedLeft),
          ])),
    );
  }
}
