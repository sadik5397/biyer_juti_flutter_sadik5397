import 'package:biyer_juti/util/global_function.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
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
          pageNoButton(label: "3", onTap: () {}),
          jumpToButton(onTap: () {}),
          totalPage(totalPage: randomNumber(999)),
          pageNoButton(label: ">", onTap: () {}, active: true),
        ]));
  }

  Padding pageNoButton({required String label, required VoidCallback onTap, bool active = false}) {
    return Padding(
      padding: ThemePadding.p1,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r1, side: BorderSide(color: active ? Colors.transparent : ThemeColor.secondary.withOpacity(.5), width: 1.5)),
              minimumSize: const Size(40, 40),
              backgroundColor: active ? ThemeColor.secondary : Colors.white,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact),
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: active ? Colors.white : ThemeColor.secondary))),
    );
  }

  Expanded jumpToButton({required VoidCallback onTap, bool active = false}) {
    List<String> options = List.generate(50, (index) => (index + 3).toString());
    return Expanded(
      child: Padding(
        padding: ThemePadding.p1,
        child: DropdownButton2(
            underline: const SizedBox(),
            buttonElevation: 1,
            dropdownElevation: 1,
            selectedItemHighlightColor: ThemeColor.lightPink.withOpacity(.1),
            isExpanded: true,
            enableFeedback: true,
            buttonPadding: ThemePadding.px3,
            buttonDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r1, color: const Color(0xfff8fafc), border: Border.all(color: ThemeColor.secondary.withOpacity(.5), width: 1.5)),
            dropdownPadding: EdgeInsets.zero,
            dropdownDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, color: ThemeColor.lightRedBackground),
            hint: Text("Go to", style: TextStyle(color: ThemeColor.primary)),
            items: options.map((item) => DropdownMenuItem<String>(value: item, child: Text(item, style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.bold)))).toList(),
            selectedItemBuilder: (context) =>
                List.generate(options.length, (index) => Align(alignment: const Alignment(-1, 0), child: Text("Page: ${options[index]}", style: TextStyle(color: ThemeColor.primary, fontSize: 14)))),
            buttonHeight: 35,
            value: null,
            onChanged: (value) {
              if (kDebugMode) print("Selected Page Number : --- $value ---");
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
    return Padding(padding: ThemePadding.p1, child: Text("of $totalPage", style: const TextStyle(fontWeight: FontWeight.bold)));
  }
}
