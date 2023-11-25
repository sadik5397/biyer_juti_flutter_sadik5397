import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/otp.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/component/text_field.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/recover_password.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../component/custom_information_section.dart';
import '../component/dropdown_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool codeSent = false;

  String selectedPrefixPhone = "Bangladesh +880";
  List<String> prefixPhones = List.generate(12, (index) => "Bangladesh +88$index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        appBar: ThemeAppBar.blank(),
        body: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: Padding(
                    padding: ThemePadding.px6,
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Image.asset("assets/logo-wide.png", height: 75),
                      SectionHeader(label: "Recover Password", topGap: false, color: ThemeColor.primary),
                      Gap.gy2,
                      CustomInformationSection(
                          innerPadding: EdgeInsets.fromLTRB(ThemePadding.value * 2.25, ThemePadding.value * 4.5, ThemePadding.value * 2.25, ThemePadding.value * 2.5),
                          header: "Phone *",
                          children: [
                            Row(children: [
                              Expanded(
                                  child: ThemeDropDownButton.pill(
                                      labelColor: Colors.white,
                                      smallSize: true,
                                      padding: ThemePadding.none,
                                      dark: true,
                                      title: "Country",
                                      options: prefixPhones,
                                      value: selectedPrefixPhone,
                                      onChanged: (value) {})),
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
                                smallSize: true,
                                innerPadding: ThemePadding.p1 * 1.5,
                                textStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
                                title: "  Send Verification Code  ",
                                onTap: () => setState(() => codeSent = true),
                                dark: true)),
                      ]),
                      Gap.gy4,
                      if (codeSent) const OTP(),
                      Gap.infinity,
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Expanded(
                            child: ThemeButton.pill(
                                color: HexColor("#C2C7D0"),
                                innerPadding: ThemePadding.p1 * 1.5,
                                textStyle: TextStyle(fontSize: 18, color: ThemeColor.jetBlack, fontWeight: FontWeight.normal),
                                title: "  Cancel  ",
                                onTap: () => routeBack(context),
                                dark: true)),
                        Gap.gx4,
                        Expanded(
                            child: ThemeButton.pill(
                                innerPadding: ThemePadding.p1 * 1.5,
                                textStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
                                title: "  Next  ",
                                onTap: () => route(context, const RecoverPassword()),
                                dark: true)),
                      ]),
                      // Progress(progress: codeSent ? 2 : 1, outOf: 7),
                      Gap.gy6
                    ])))));
  }
}
