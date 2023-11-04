import 'package:biyer_juti/theme/border_radius.dart';
import 'package:flutter/material.dart';

class Hyperlink extends StatelessWidget {
  const Hyperlink({Key? key, required this.child, required this.onTap, this.borderRadius, this.inkIntensity}) : super(key: key);
  final Widget child;
  final void Function() onTap;
  final BorderRadius? borderRadius;
  final double? inkIntensity;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      Positioned.fill(
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  borderRadius: borderRadius ?? ThemeBorderRadius.r4,
                  hoverColor: Colors.black.withOpacity(inkIntensity ?? .075),
                  highlightColor: Colors.black.withOpacity(inkIntensity ?? .075),
                  splashColor: Colors.black.withOpacity(inkIntensity ?? .075),
                  onTap: onTap)))
    ]);
  }
}
