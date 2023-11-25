import 'package:biyer_juti/component/bread_crumb.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../component/app_bar.dart';
import '../component/button.dart';
import '../component/custom_information_section.dart';
import '../component/dropdown_button.dart';
import '../component/otp.dart';
import '../component/text_field.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../util/page_navigation.dart';

class ChangeMobile extends StatefulWidget {
  const ChangeMobile({Key? key}) : super(key: key);

  @override
  State<ChangeMobile> createState() => _ChangeMobileState();
}

class _ChangeMobileState extends State<ChangeMobile> {
  bool codeSent = false;
  String selectedPrefixPhone = "Bangladesh +880";
  List<String> prefixPhones = List.generate(12, (index) => "Bangladesh +88$index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          const BreadCrumb(["Account Settings", "Change Phone Number"]),
          Padding(
              padding: ThemePadding.p3,
              child: Column(children: [
                CustomInformationSection(
                    backgroundColor: HexColor("#fffbfe"),
                    innerPadding: EdgeInsets.fromLTRB(ThemePadding.value * 2.25, ThemePadding.value * 4.5, ThemePadding.value * 2.25, ThemePadding.value * 2.5),
                    header: "Phone *",
                    children: [
                      Row(children: [
                        Expanded(
                            child: ThemeDropDownButton.pill(
                                labelColor: Colors.white, smallSize: true, padding: ThemePadding.none, dark: true, title: "Country", options: prefixPhones, value: selectedPrefixPhone, onChanged: (value) {})),
                        Expanded(
                            child: ThemeTextField.pill(
                                boldStyle: true,
                                smallSize: true,
                                padding: ThemePadding.pl2,
                                showLabel: false,
                                labelText: "Phone",
                                autoFocus: true,
                                keyboardType: TextInputType.number,
                                controller: TextEditingController()))
                      ])
                    ]),
                Gap.gy6,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Center(
                      child: ThemeButton.pill(
                    dark: true,
                    smallSize: true,
                    boldTitle: true,
                    title: "      Verify      ",
                    onTap: () => setState(() => codeSent = true),
                  )),
                ]),
                Gap.gy4,
                if (codeSent) const OTP(),
                Gap.gy6,
                Padding(
                    padding: ThemePadding.px6 * 4, child: ThemeButton.pill(dark: true, boldTitle: true, smallSize: true, title: "    Confirm    ", onTap: () => routeBack(context), color: ThemeColor.secondary)),
                // Progress(progress: codeSent ? 2 : 1, outOf: 7),
                Gap.gy6
              ]))
        ]));
  }
}
