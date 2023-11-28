import 'package:biyer_juti/component/text_field.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeDropDownButton {
  static Padding primary(
      {double? width,
      EdgeInsets? padding,
      bool useSearch = false,
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
              searchInnerWidget: useSearch ? ThemeTextField.pill(padding: ThemePadding.p4, showLabel: false, controller: search, labelText: "Search") : null,
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
              hint: Text(title, style: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w500)),
              items: options.map((item) => DropdownMenuItem<String>(value: item, child: Text(item, style: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w500)))).toList(),
              selectedItemBuilder: (context) => List.generate(options.length,
                  (index) => Align(alignment: const Alignment(-1, 0), child: Text("$title: ${options[index]}", style: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w500)))),
              buttonHeight: 40,
              value: value,
              onChanged: onChanged,
              buttonWidth: width ?? double.maxFinite,
              dropdownMaxHeight: 500),
        ));
  }

  static Padding pill(
      {double? width,
      EdgeInsets? padding,
      Color? labelColor,
      bool useSearch = false,
      bool smallSize = true,
      bool iconRightSide = false,
      bool useBorder = false,
      double? fontSize,
      bool isDisable = false,
      bool showLabelWhenSelected = false,
      required String title,
      required List<String> options,
      required dynamic value,
      required void Function(Object? value) onChanged,
      bool dark = false}) {
    TextEditingController search = TextEditingController();
    return Padding(
        padding: padding ?? ThemePadding.pb4,
        child: AbsorbPointer(
          absorbing: isDisable,
          child: DropdownButton2(
              searchController: useSearch ? search : null,
              searchInnerWidget: useSearch
                  ? ThemeTextField.pill(padding: ThemePadding.p4, showLabel: false, controller: search, labelText: "Search")
                  : Padding(padding: ThemePadding.py3, child: Text("Select " "$title", style: TextStyle(fontSize: 12, color: ThemeColor.primary))),
              searchMatchFn: (item, searchValue) => item.value.toString().toLowerCase().contains(searchValue.toLowerCase()),
              underline: const SizedBox(),
              iconEnabledColor: HexColor("#e18e8e"),
              buttonElevation: 0,
              dropdownElevation: 1,
              icon: Gap.none,
              selectedItemHighlightColor: ThemeColor.lightPink.withOpacity(.1),
              isExpanded: true,
              enableFeedback: true,
              buttonPadding: ThemePadding.px3,
              buttonDecoration: BoxDecoration(
                  border: useBorder ? Border.all(color: (labelColor ?? ThemeColor.red).withOpacity(.25), width: 1) : null,
                  borderRadius: ThemeBorderRadius.r6,
                  color: isDisable
                      ? Colors.black12
                      : dark
                          ? ThemeColor.secondary
                          : Colors.white),
              dropdownPadding: ThemePadding.none,
              dropdownDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r6, color: ThemeColor.lightRedBackground),
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!iconRightSide) Icon(FeatherIcons.chevronDown, color: labelColor ?? (dark ? Colors.white : ThemeColor.primary), size: 12),
                  if (!iconRightSide) Gap.gx1,
                  Text(title, style: TextStyle(color: labelColor ?? (dark ? Colors.white : ThemeColor.primary), fontSize: fontSize)),
                  if (iconRightSide) Gap.gx1,
                  if (iconRightSide) Icon(FeatherIcons.chevronDown, color: labelColor ?? (dark ? Colors.white : ThemeColor.primary), size: 12),
                ],
              ),
              items: options
                  .map((item) => DropdownMenuItem<String>(
                      value: item, child: Center(child: Text(item, textAlign: TextAlign.center, style: TextStyle(color: HexColor("#CD7B7B"), fontSize: 14, fontWeight: FontWeight.bold)))))
                  .toList(),
              selectedItemBuilder: (context) => List.generate(
                  options.length,
                  (index) => Align(
                      alignment: const Alignment(-1, 0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text("${showLabelWhenSelected ? '$title :' : ''} ${options[index]}", style: TextStyle(color: dark ? Colors.white : ThemeColor.primary, fontSize: 14)),
                        Gap.gx1,
                        Icon(FeatherIcons.chevronDown, color: labelColor ?? (dark ? Colors.white : ThemeColor.primary), size: 12)
                      ]))),
              buttonHeight: ThemePadding.value * 8,
              value: value,
              onChanged: onChanged,
              buttonWidth: width ?? double.maxFinite,
              dropdownMaxHeight: 500),
        ));
  }

  static Expanded expandedSearch(
      {double? width,
      bool useSearch = false,
      EdgeInsets? padding,
      bool isDisable = false,
      bool useBorder = false,
      bool iconRightSide = false,
      double? fontSize,
      Color? labelColor,
      bool showLabelWhenSelected = false,
      required String title,
      required List<String> options,
      required dynamic value,
      required void Function(Object? value) onChanged,
      bool dark = false}) {
    return Expanded(
        child: pill(
            title: title,
            options: options,
            useBorder: useBorder,
            value: value,
            onChanged: onChanged,
            fontSize: fontSize,
            padding: padding,
            isDisable: isDisable,
            width: width,
            labelColor: labelColor,
            iconRightSide: iconRightSide,
            dark: dark,
            showLabelWhenSelected: showLabelWhenSelected,
            useSearch: useSearch));
  }
  static AbsorbPointer inline(
      {double? width,
        EdgeInsets? padding,
        Color? labelColor,
        bool useSearch = false,
        bool smallSize = true,
        bool iconRightSide = false,
        bool useBorder = false,
        double? fontSize,
        bool isDisable = false,
        bool showLabelWhenSelected = false,
        required String title,
        required List<String> options,
        required dynamic value,
        required void Function(Object? value) onChanged,
        bool dark = false}) {
    TextEditingController search = TextEditingController();
    return AbsorbPointer(
      absorbing: isDisable,
      child: DropdownButton2(
          searchController: useSearch ? search : null,
          searchInnerWidget: useSearch
              ? ThemeTextField.pill(padding: ThemePadding.p4, showLabel: false, controller: search, labelText: "Search")
              : Padding(padding: ThemePadding.py3, child: Text("Select " "$title", style: TextStyle(fontSize: 12, color: ThemeColor.primary))),
          searchMatchFn: (item, searchValue) => item.value.toString().toLowerCase().contains(searchValue.toLowerCase()),
          underline: const SizedBox(),
          iconEnabledColor: HexColor("#e18e8e"),
          buttonElevation: 0,
          dropdownElevation: 1,
          icon: Gap.none,
          selectedItemHighlightColor: ThemeColor.lightPink.withOpacity(.1),
          isExpanded: true,
          enableFeedback: true,
          buttonPadding: ThemePadding.px3,
          buttonDecoration: BoxDecoration(
              border: useBorder ? Border.all(color: ThemeColor.primary.withOpacity(.25), width: 1) : null,
              borderRadius: ThemeBorderRadius.r2,
              color: isDisable
                  ? Colors.black12
                  : dark
                  ? ThemeColor.secondary
                  : Colors.white),
          dropdownPadding: ThemePadding.none,
          dropdownDecoration: BoxDecoration(borderRadius: ThemeBorderRadius.r2, color: ThemeColor.lightRedBackground),
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!iconRightSide) Icon(FeatherIcons.chevronDown, color: labelColor ?? (dark ? Colors.white : ThemeColor.primary), size: 12),
              if (!iconRightSide) Gap.gx1,
              Text(title, style: TextStyle(color: labelColor ?? (dark ? Colors.white : ThemeColor.primary), fontSize: fontSize)),
              if (iconRightSide) Gap.gx1,
              if (iconRightSide) Icon(FeatherIcons.chevronDown, color: labelColor ?? (dark ? Colors.white : ThemeColor.primary), size: 12),
            ],
          ),
          items: options
              .map((item) => DropdownMenuItem<String>(
              value: item, child: Center(child: Text(item, textAlign: TextAlign.center, style: TextStyle(color: HexColor("#CD7B7B"), fontSize: 14, fontWeight: FontWeight.bold)))))
              .toList(),
          selectedItemBuilder: (context) => List.generate(
              options.length,
                  (index) => Align(
                  alignment: const Alignment(-1, 0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("${showLabelWhenSelected ? '$title :' : ''} ${options[index]}", style: TextStyle(color: dark ? Colors.white : ThemeColor.primary, fontSize: 14)),
                    Gap.gx1,
                    Icon(FeatherIcons.chevronDown, color: labelColor ?? (dark ? Colors.white : ThemeColor.primary), size: 12)
                  ]))),
          buttonHeight: ThemePadding.value * 12,
          value: value,
          onChanged: onChanged,
          buttonWidth: width ?? double.maxFinite,
          dropdownMaxHeight: 500),
    );
  }
}
