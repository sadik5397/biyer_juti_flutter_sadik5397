import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/theme/text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeDropDownButton {
  static Padding primary(
      {double? width,
      EdgeInsets? padding,
      bool useSearch = true,
      bool isDisable = false,
      required String title,
      required List<String> options,
      required dynamic value,
      required void Function(Object? value) onChanged}) {
    TextEditingController search = TextEditingController();
    return Padding(
        padding: padding ?? ThemePadding.pb3,
        child: AbsorbPointer(
          absorbing: isDisable,
          child: DropdownButton2(
              searchController: useSearch ? search : null,
              // searchInnerWidget: useSearch ? primaryTextField(padding: primaryPadding, showLabel: false, controller: search, labelText: "Search") : null,
              searchMatchFn: (item, searchValue) => item.value.toString().toLowerCase().contains(searchValue.toLowerCase()),
              underline: const SizedBox(),
              iconEnabledColor: ThemeColor.jetBlack.withOpacity(.5),
              buttonElevation: 0,
              dropdownElevation: 1,
              selectedItemHighlightColor: HexColor("#edf5f3"),
              isExpanded: true,
              enableFeedback: true,
              buttonPadding: ThemePadding.px3,
              buttonDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r1, color: isDisable ? Colors.black12 : const Color(0xfff8fafc), border: Border.all(color: const Color(0xffced4da))),
              dropdownPadding: EdgeInsets.zero,
              dropdownDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r1, color: Colors.white),
              hint: Text(title, style: ThemeTextStyle.textFieldLabel),
              items: options.map((item) => DropdownMenuItem<String>(value: item, child: Text(item, style: ThemeTextStyle.textFieldLabel))).toList(),
              selectedItemBuilder: (context) =>
                  List.generate(options.length, (index) => Align(alignment: const Alignment(-1, 0), child: Text("$title: ${options[index]}", style: ThemeTextStyle.textFieldLabel))),
              buttonHeight: 40,
              value: value,
              onChanged: onChanged,
              buttonWidth: width ?? double.maxFinite,
              dropdownMaxHeight: 500),
        ));
  }

  static Padding search(
      {double? width, EdgeInsets? padding, bool isDisable = false, required String title, required List<String> options, required dynamic value, required void Function(Object? value) onChanged}) {
    return Padding(
        padding: padding ?? ThemePadding.pb3,
        child: AbsorbPointer(
          absorbing: isDisable,
          child: DropdownButton2(
              searchInnerWidget: Padding(padding: ThemePadding.py3, child: Text("Select $title", style: TextStyle(fontSize: 12, color: ThemeColor.primary))),
              searchMatchFn: (item, searchValue) => item.value.toString().toLowerCase().contains(searchValue.toLowerCase()),
              underline: const SizedBox(),
              iconEnabledColor: HexColor("#e18e8e"),
              buttonElevation: 0,
              dropdownElevation: 1,
              selectedItemHighlightColor: ThemeColor.lightPink.withOpacity(.1),
              isExpanded: true,
              enableFeedback: true,
              buttonPadding: ThemePadding.px3,
              buttonDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, color: isDisable ? Colors.black12 : const Color(0xfff8fafc)),
              dropdownPadding: EdgeInsets.zero,
              dropdownDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, color: ThemeColor.lightRedBackground),
              hint: Text(title, style: TextStyle(color: ThemeColor.primary)),
              items: options.map((item) => DropdownMenuItem<String>(value: item, child: Text(item, style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.bold)))).toList(),
              selectedItemBuilder: (context) =>
                  List.generate(options.length, (index) => Align(alignment: const Alignment(-1, 0), child: Text("$title: ${options[index]}", style: TextStyle(color: ThemeColor.primary, fontSize: 14)))),
              buttonHeight: 40,
              value: value,
              onChanged: onChanged,
              buttonWidth: width ?? double.maxFinite,
              dropdownMaxHeight: 500),
        ));
  }

  static Expanded expandedSearch(
      {double? width, EdgeInsets? padding, bool isDisable = false, required String title, required List<String> options, required dynamic value, required void Function(Object? value) onChanged}) {
    return Expanded(child: search(title: title, options: options, value: value, onChanged: onChanged, padding: padding, isDisable: isDisable, width: width));
  }
}
