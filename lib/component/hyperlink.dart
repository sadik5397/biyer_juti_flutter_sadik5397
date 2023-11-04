import 'package:flutter/material.dart';

class Hyperlink extends StatelessWidget {
  const Hyperlink({Key? key, required this.child, required this.onTap, this.borderRadius, this.inkIntensity}) : super(key: key);
  final Widget child;
  final void Function() onTap;
  final double? borderRadius;
  final double? inkIntensity;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      Positioned.fill(
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  borderRadius: BorderRadius.circular(borderRadius ?? 16),
                  hoverColor: Colors.black.withOpacity(inkIntensity ?? .15),
                  highlightColor: Colors.black.withOpacity(inkIntensity ?? .15),
                  splashColor: Colors.black.withOpacity(inkIntensity ?? .15),
                  onTap: onTap)))
    ]);
  }
}
