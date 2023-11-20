import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

class BreadCrumb extends StatelessWidget {
  const BreadCrumb(this.routes, {super.key});

  final List<String> routes;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: ThemePadding.p4,
        child: Row(children: List.generate(routes.length, (index) => Text("${routes[index]}${index == routes.length - 1 ? '' : ' > '}", style: TextStyle(color: ThemeColor.secondary)))));
  }
}
