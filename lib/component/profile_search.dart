import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../theme/shadow.dart';
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
  bool showAdvanced = false, lockSearchFilter = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ThemePadding.pb6,
      child: Stack(
          children: [
        Container(
            padding: ThemePadding.p6,
            margin: ThemePadding.pb5,
            decoration: BoxDecoration(gradient: ThemeGradient.primary, borderRadius: ThemeBorderRadius.r6, boxShadow: ThemeShadow.primary, border: Border.all(width: 2, color: Colors.black.withOpacity(.1))),
            width: double.maxFinite,
            child: Column(children: [
              const Text("Find Your Life Partner", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              Gap.gy6,
              Text("Preferred Age: ${(selectedRange.start).toInt()}-${(selectedRange.end).toInt()} years", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              RangeSlider(
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.white.withOpacity(.2)),
                onChanged: (newRange) => setState(() => selectedRange = newRange),
                activeColor: Colors.white,
                min: minimumValue.toDouble(),
                max: maximumValue.toDouble(),
                divisions: maximumValue - minimumValue,
                labels: RangeLabels("${(selectedRange.start).toInt()}", "${(selectedRange.end).toInt()}"),
                values: selectedRange,
              ),
              Gap.gy4,
              Row(children: [
                ThemeDropDownButton.expandedSearch(title: "Region", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                Gap.gx2,
                ThemeDropDownButton.expandedSearch(title: "Marital Status", options: ["a", "b", "c"], value: "a", onChanged: (value) {})
              ]),
              Row(children: [
                ThemeButton.expandedPill(title: "Reset Search", onTap: () {}, icon: FontAwesomeIcons.rotateLeft),
                Gap.gx2,
                ThemeButton.expandedPill(title: "Search", onTap: () {}, icon: FontAwesomeIcons.magnifyingGlass, dark: true),
              ]),
              ThemeButton.pill(
                  title: "Advanced Search Filters",
                  onTap: () => setState(() => showAdvanced = !showAdvanced),
                  icon: showAdvanced ? FontAwesomeIcons.angleDown : FontAwesomeIcons.angleRight,
                  padding: (ThemePadding.px6 * 2),
                  dark: showAdvanced)
            ])),
        Container(
            padding: ThemePadding.p6,
            margin: ThemePadding.pb5,
            decoration:
                BoxDecoration(gradient: ThemeGradient.advancedSearch, borderRadius: ThemeBorderRadius.r6, boxShadow: ThemeShadow.primary, border: Border.all(width: 2, color: Colors.black.withOpacity(.1))),
            width: double.maxFinite,
            child: Column(children: [
              SizedBox(height: Gap.value * 68),
              AnimatedCrossFade(
                  crossFadeState: showAdvanced ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 500),
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
                        ]),
                      ),
                    ThemeButton.pill(title: "Search by Profile ID", onTap: () {}),
                    Row(children: [
                      ThemeDropDownButton.expandedSearch(title: "Citizenship", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                      Gap.gx2,
                      ThemeDropDownButton.expandedSearch(title: "Education", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                    ]),
                    Row(children: [
                      ThemeDropDownButton.expandedSearch(title: "Min. Height", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                      Gap.gx2,
                      ThemeDropDownButton.expandedSearch(title: "Profession", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                    ]),
                    Row(children: [
                      ThemeDropDownButton.expandedSearch(title: "Min. Height", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                      Gap.gx2,
                      ThemeDropDownButton.expandedSearch(title: "Profession", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                    ]),
                    ThemeDropDownButton.search(title: "Hometown", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                    const Text("Present Address", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    Gap.gy3,
                    Row(children: [
                      ThemeDropDownButton.expandedSearch(title: "Country", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                      Gap.gx2,
                      ThemeDropDownButton.expandedSearch(title: "District", options: ["a", "b", "c"], value: "a", onChanged: (value) {}),
                    ]),
                    Row(children: [
                      ThemeButton.expandedPill(title: "Reset Search", onTap: () {}, icon: FontAwesomeIcons.rotateLeft),
                      Gap.gx2,
                      ThemeButton.expandedPill(title: "Adv. Search", onTap: () {}, icon: FontAwesomeIcons.magnifyingGlass, dark: true),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("Lock Search Filter", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      Gap.gx2,
                      Switch(value: lockSearchFilter, activeColor: ThemeColor.secondary, onChanged: (value) => setState(() => lockSearchFilter = !lockSearchFilter))
                    ])
                  ]))
            ]))
      ].reversed.toList()),
    );
  }
}
