import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';
import '../theme/shadow.dart';

class Pagination extends StatelessWidget {
  const Pagination({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: ThemePadding.p3,
        margin: ThemePadding.pb4,
        decoration: BoxDecoration(color: Colors.white, boxShadow: ThemeShadow.primary, borderRadius: ThemeBorderRadius.r2),
        child: Row(children: [
          pageNoButton(label: "<", onTap: () {}, active: true),
          pageNoButton(label: "1", onTap: () {}),
          pageNoButton(label: "2", onTap: () {}, active: true),
          jumpToButton(onTap: () {}),
          totalPage(totalPage: 124),
          pageNoButton(label: ">", onTap: () {}, active: true),
        ]));
  }

  Padding pageNoButton({required String label, required VoidCallback onTap, bool active = false}) {
    return Padding(
      padding: ThemePadding.p1,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r1, side: BorderSide(color: active ? Colors.transparent : ThemeColor.secondary.withOpacity(.5), width: 1.5)),
              minimumSize: const Size(40, 40),
              backgroundColor: active ? ThemeColor.secondary : Colors.white,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact),
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: active ? Colors.white : ThemeColor.secondary))),
    );
  }
  Expanded jumpToButton({required VoidCallback onTap, bool active = false}) {
    return Expanded(
      child: Padding(
        padding: ThemePadding.p1,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r1, side: BorderSide(color: active ? Colors.transparent : ThemeColor.secondary.withOpacity(.5), width: 1.5)),
                minimumSize: const Size(40, 40),
                backgroundColor: active ? ThemeColor.secondary : Colors.white,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact),
            child: Text("Go to ▼", style: TextStyle(fontWeight: FontWeight.bold, color: active ? Colors.white : ThemeColor.secondary))),
      ),
    );
  }
  Padding totalPage({required int totalPage}) {
    return Padding(padding: ThemePadding.p1, child: Text("of $totalPage", style: const TextStyle(fontWeight: FontWeight.bold)));
  }
}