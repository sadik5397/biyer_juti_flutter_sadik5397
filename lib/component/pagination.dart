import 'package:biyer_juti/util/global_function.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';
import '../theme/shadow.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: ThemePadding.p3 / 2,
        margin: ThemePadding.pb6,
        decoration: BoxDecoration(color: Colors.white, boxShadow: ThemeShadow.primary, borderRadius: ThemeBorderRadius.r2),
        child: Row(children: [
          pageNoButton(label: "<", icon: FeatherIcons.chevronLeft, onTap: () {}, useBorder: false, useLeftBorder: false),
          pageNoButton(label: "1", onTap: () {}, useBorder: false),
          pageNoButton(label: "2", onTap: () {}, active: true, useLeftBorder: false),
          pageNoButton(label: "3", onTap: () {}, useBorder: false, useLeftBorder: false),
          pageNoButton(label: "...", onTap: () {}, useBorder: false),
          pageNoButton(label: "99", onTap: () {}, useBorder: false),
          pageNoButton(label: ">", icon: FeatherIcons.chevronRight, onTap: () {}, useBorder: false),
          jumpToButton(onTap: () {}),
          // totalPage(totalPage: randomNumber(999)),
        ]));
  }

  Container pageNoButton({bool useLeftBorder = true, required String label, IconData? icon, required VoidCallback onTap, bool active = false, bool useBorder = true}) {
    return Container(
      margin: ThemePadding.p1.copyWith(left: 0),
      padding: ThemePadding.pl1,
      decoration: useLeftBorder ? BoxDecoration(border: Border(left: BorderSide(width: .75, color: ThemeColor.jetBlack.withOpacity(.2)))) : null,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              elevation: useBorder ? null : 0,
              shape: RoundedRectangleBorder(
                  borderRadius: ThemeBorderRadius.r1,
                  side: useBorder
                      ? BorderSide(
                          color: ThemeColor.jetBlack.withOpacity(.25),
                        )
                      : BorderSide(color: (active || !useBorder) ? Colors.transparent : ThemeColor.secondary.withOpacity(.5), width: 1.5)),
              minimumSize: const Size(30, 30),
              backgroundColor: useBorder ? (active ? ThemeColor.secondary : Colors.white) : Colors.transparent,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact),
          child: icon == null ? Text(label, style: TextStyle(fontWeight: FontWeight.normal, color: useBorder ? (active ? Colors.white : ThemeColor.jetBlack) : ThemeColor.jetBlack.withOpacity(.5))) : Icon(icon, color: ThemeColor.primary, size: 16)),
    );
  }

  Expanded jumpToButton({required VoidCallback onTap, bool active = false}) {
    List<String> options = List.generate(50, (index) => (index + 4).toString());
    return Expanded(
      child: Padding(
        padding: ThemePadding.p1,
        child: DropdownButton2(
            underline: const SizedBox(),
            buttonElevation: 0,
            dropdownElevation: 1,
            selectedItemHighlightColor: ThemeColor.lightPink.withOpacity(.1),
            isExpanded: true,
            icon: SizedBox(),
            enableFeedback: true,
            buttonPadding: ThemePadding.px3,
            buttonDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r1, color: ThemeColor.primary, border: Border.all(color: Colors.transparent, width: 1.5)),
            dropdownPadding: EdgeInsets.zero,
            dropdownDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, color: ThemeColor.lightRedBackground),
            hint: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Jump to : ", style: TextStyle(color: Colors.white, fontSize: 12)), Icon(FeatherIcons.chevronDown, color: Colors.white, size: 12)],
            ),
            items: options.map((item) => DropdownMenuItem<String>(value: item, child: Text(item, style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.bold)))).toList(),
            selectedItemBuilder: (context) => List.generate(options.length, (index) => Align(alignment: const Alignment(-1, 0), child: Text("Page: ${options[index]}", style: TextStyle(color: ThemeColor.primary, fontSize: 12)))),
            buttonHeight: 25,
            value: null,
            onChanged: (value) {
              if (kDebugMode) print("Selected Page Number : --- $value ---");
              setState(() {});
            },
            buttonWidth: double.maxFinite,
            dropdownMaxHeight: 500),

        // ElevatedButton(
        //     onPressed: onTap,
        //     style: ElevatedButton.styleFrom(
        //         padding: EdgeInsets.zero,
        //         shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r1, side: BorderSide(color: active ? Colors.transparent : ThemeColor.secondary.withOpacity(.5), width: 1.5)),
        //         minimumSize: const Size(40, 40),
        //         backgroundColor: active ? ThemeColor.secondary : Colors.white,
        //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //         visualDensity: VisualDensity.compact),
        //     child: Text("Go to ▼", style: TextStyle(fontWeight: FontWeight.bold, color: active ? Colors.white : ThemeColor.secondary))),
      ),
    );
  }

  Padding totalPage({required int totalPage}) {
    return Padding(padding: ThemePadding.p1, child: Text("of $totalPage", style: const TextStyle(fontWeight: FontWeight.normal)));
  }
}
