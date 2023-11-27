import 'package:biyer_juti/api/dummy_daya.dart';
import 'package:biyer_juti/component/text_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import 'button.dart';
import 'dropdown_button.dart';

class ProfileSearch extends StatefulWidget {
  const ProfileSearch({Key? key, required this.needToBePremium}) : super(key: key);
  final bool needToBePremium;

  @override
  State<ProfileSearch> createState() => _ProfileSearchState();
}

class _ProfileSearchState extends State<ProfileSearch> {
  RangeValues selectedRange = const RangeValues(22, 32);
  int minimumValue = 18, maximumValue = 90;
  bool showAdvanced = false, lockSearchFilter = false, lock = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: ThemePadding.pb6,
        child: Stack(
            children: [
          Padding(
              padding: ThemePadding.pb6,
              child: Material(
                  elevation: 20,
                  shadowColor: Colors.black.withOpacity(.5),
                  borderRadius: ThemeBorderRadius.r5 * 2,
                  child: Container(
                      padding: ThemePadding.p6.copyWith(left: ThemePadding.value * 2, right: ThemePadding.value * 2) * 1.25,
                      decoration: BoxDecoration(gradient: ThemeGradient.primary, borderRadius: ThemeBorderRadius.r5 * 2, border: Border.all(color: HexColor("#da6364"), width: 2)),
                      child: Column(children: [
                        const Text("Find Your Life Partner", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        Gap.gy5,
                        Text("Preferred Age: ${(selectedRange.start).toInt()}-${(selectedRange.end).toInt()} years", style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal)),
                        Stack(alignment: Alignment.center, children: [
                          Container(width: double.maxFinite, height: 6, decoration: BoxDecoration(color: Colors.white, borderRadius: ThemeBorderRadius.r6)),
                          SliderTheme(
                            data: SliderThemeData(valueIndicatorColor: ThemeColor.secondary),
                            child: RangeSlider(
                              overlayColor: MaterialStateColor.resolveWith((states) => Colors.white.withOpacity(.2)),
                              onChanged: (newRange) => setState(() => selectedRange = newRange),
                              activeColor: ThemeColor.secondary,
                              inactiveColor: Colors.white,
                              min: minimumValue.toDouble(),
                              max: maximumValue.toDouble(),
                              divisions: maximumValue - minimumValue,
                              labels: RangeLabels("${(selectedRange.start).toInt()}", "${(selectedRange.end).toInt()}"),
                              values: selectedRange,
                            ),
                          )
                        ]),
                        Gap.gy4,
                        Row(children: [
                          ThemeDropDownButton.expandedSearch(title: "Religion", options: DummyData.randomNames, value: null, fontSize: 12, onChanged: (value) {}, iconRightSide: true),
                          Gap.gx2,
                          ThemeDropDownButton.expandedSearch(title: "Marital Status", options: DummyData.randomNames, value: null, fontSize: 12, onChanged: (value) {}, iconRightSide: true)
                        ]),
                        Row(children: [
                          ThemeButton.expandedPill(fontSize: 12, title: "Reset Search", onTap: () {}, svgIcon: "assets/svg/refresh.svg", icon: FeatherIcons.refreshCcw, iconRightSide: true, smallSize: true),
                          Gap.gx2,
                          ThemeButton.expandedPill(elevation: 5, fontSize: 12, title: "Search", onTap: () {}, icon: FeatherIcons.search, dark: true, iconRightSide: true, smallSize: true),
                        ]),
                        ThemeButton.pill(
                            fontSize: 12,
                            elevation: 10,
                            smallSize: true,
                            title: "Advanced Search Filters",
                            onTap: () => setState(() => showAdvanced = !showAdvanced),
                            icon: showAdvanced ? FeatherIcons.chevronDown : FeatherIcons.chevronRight,
                            padding: (ThemePadding.px4 * 4),
                            dark: showAdvanced,
                            iconRightSide: true)
                      ])))),
          Padding(
              padding: ThemePadding.pb6,
              child: Material(
                  elevation: 30,
                  shadowColor: Colors.black.withOpacity(.5),
                  borderRadius: ThemeBorderRadius.r5 * 2,
                  child: Container(
                      padding: ThemePadding.p6.copyWith(left: ThemePadding.value * 2, right: ThemePadding.value * 2) * 1.25,
                      decoration: BoxDecoration(gradient: ThemeGradient.advancedSearch, borderRadius: ThemeBorderRadius.r5 * 2, border: Border.all(color: HexColor("#da6364"), width: 2)),
                      child: Column(children: [
                        SizedBox(height: Gap.value * 58),
                        AnimatedCrossFade(
                            crossFadeState: showAdvanced ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 750),
                            firstChild: Gap.infinityX,
                            secondChild: Column(children: [
                              SizedBox(height: Gap.value * 16),
                              if (widget.needToBePremium)
                                Padding(
                                    padding: ThemePadding.pb3,
                                    child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                      Expanded(child: Divider(color: ThemeColor.yellow, thickness: 2)),
                                      SvgPicture.asset("assets/svg/gold_crown.svg", width: 40, height: 40),
                                      Text("For Premium Members Only  ", style: TextStyle(height: .6, fontSize: 16, fontWeight: FontWeight.bold, color: ThemeColor.yellow)),
                                      Expanded(child: Divider(color: ThemeColor.yellow, thickness: 2))
                                    ])),
                              AbsorbPointer(
                                  absorbing: widget.needToBePremium,
                                  child: Opacity(
                                    opacity: 1,
                                      // opacity: widget.needToBePremium ? 0.6 : 1,
                                      child: Column(children: [
                                        if (!widget.needToBePremium) Gap.gy2,
                                        ThemeTextField.pill(labelText: "Search by Profile ID", controller: TextEditingController(), showLabel: false, centerAlign: true, smallSize: true, hintColor: ThemeColor.red, fontSize: 12),
                                        Row(children: [
                                          ThemeDropDownButton.expandedSearch(title: "Citizenship", options: DummyData.randomNames, value: null, onChanged: (value) {}, iconRightSide: true, fontSize: 12, labelColor: ThemeColor.red),
                                          Gap.gx1_7,
                                          ThemeDropDownButton.expandedSearch(title: "Education", options: DummyData.randomNames, value: null, onChanged: (value) {}, iconRightSide: true, fontSize: 12, labelColor: ThemeColor.red),
                                          Gap.gx1_7,
                                          ThemeDropDownButton.expandedSearch(title: "Min. Height", options: DummyData.randomNames, value: null, onChanged: (value) {}, iconRightSide: true, fontSize: 12, labelColor: ThemeColor.red),
                                        ]),
                                        Row(children: [
                                          ThemeDropDownButton.expandedSearch(title: "Profession", options: DummyData.randomNames, value: null, onChanged: (value) {}, iconRightSide: true, fontSize: 12, labelColor: ThemeColor.red),
                                          Gap.gx2,
                                          Expanded(flex: 2, child: ThemeDropDownButton.pill(title: "Hometown", options: DummyData.randomNames, value: null, onChanged: (value) {}, iconRightSide: true, fontSize: 12, labelColor: ThemeColor.red)),
                                        ]),
                                        const Text("Present Address", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                                        Gap.gy3,
                                        Row(children: [
                                          ThemeDropDownButton.expandedSearch(title: "Country", options: DummyData.randomNames, value: null, onChanged: (value) {}, iconRightSide: true, fontSize: 12, labelColor: ThemeColor.red),
                                          Gap.gx2,
                                          ThemeDropDownButton.expandedSearch(title: "District", options: DummyData.randomNames, value: null, onChanged: (value) {}, iconRightSide: true, fontSize: 12, labelColor: ThemeColor.red),
                                          Gap.gx2,
                                          ThemeDropDownButton.expandedSearch(title: "Upazila", options: DummyData.randomNames, value: null, onChanged: (value) {}, iconRightSide: true, fontSize: 12, labelColor: ThemeColor.red),
                                        ]),
                                        Row(children: [
                                          ThemeButton.expandedPill(
                                              title: "Reset Search",
                                              svgIcon: "assets/svg/refresh.svg",
                                              onTap: () {},
                                              icon: FeatherIcons.refreshCw,
                                              iconRightSide: true,
                                              smallSize: true,
                                              fontSize: 12,
                                              titleColor: ThemeColor.red,
                                              border: true,
                                              borderStyle: Border.all(color: HexColor("#B74242"), width: 3)),
                                          Gap.gx2,
                                          ThemeButton.expandedPill(title: "Advanced Search", onTap: () {}, icon: FeatherIcons.search, iconRightSide: true, smallSize: true, fontSize: 12, titleColor: ThemeColor.red, border: true, borderStyle: Border.all(color: HexColor("#661010"), width: 3)),
                                        ]),
                                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          const Text("Lock Search Filter", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                                          Gap.gx2,
                                          InkWell(
                                              onTap: () => setState(() => lock = !lock),
                                              child: AnimatedCrossFade(
                                                  firstChild: SvgPicture.asset("assets/svg/unlock.svg", height: 26), secondChild: SvgPicture.asset("assets/svg/lock.svg", height: 26), crossFadeState: lock ? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: Duration(milliseconds: 350)))
                                          // Switch(value: lockSearchFilter, activeColor: ThemeColor.secondary, onChanged: (value) => setState(() => lockSearchFilter = !lockSearchFilter))
                                        ])
                                      ])))
                            ]))
                      ]))))
        ].reversed.toList()));
  }
}
