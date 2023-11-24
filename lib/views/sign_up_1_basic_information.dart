import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/custom_information_section.dart';
import 'package:biyer_juti/component/dropdown_button.dart';
import 'package:biyer_juti/component/otp.dart';
import 'package:biyer_juti/component/progress.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/component/text_field.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/sign_up_2_account_information.dart';
import 'package:flutter/material.dart';

class SignUp1BasicInformation extends StatefulWidget {
  const SignUp1BasicInformation({super.key});

  @override
  State<SignUp1BasicInformation> createState() => _SignUp1BasicInformationState();
}

class _SignUp1BasicInformationState extends State<SignUp1BasicInformation> {
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
                      SectionHeader(label: "Basic Information", topGap: false, color: ThemeColor.primary),
                      Gap.gy2,
                      CustomInformationSection(innerPadding: EdgeInsets.fromLTRB(ThemePadding.value * 2.25, ThemePadding.value * 4.5, ThemePadding.value * 2.25, ThemePadding.value * 2.5), header: "Phone *", children: [
                        Row(
                          children: [
                            Expanded(child: ThemeDropDownButton.pill(padding: ThemePadding.none, dark: true, title: "Country", options: prefixPhones, value: selectedPrefixPhone, onChanged: (value) {})),
                            Expanded(child: ThemeTextField.pill(boldStyle: true, smallSize:true, padding: ThemePadding.pl2, showLabel: false, labelText: "Phone", controller: TextEditingController())),
                          ],
                        )
                      ]),
                      // ThemeTextField.primary(labelText: "Your Phone Number", controller: TextEditingController(text: "+880"), required: true, keyboardType: TextInputType.phone, autoFocus: true, autofillHints: AutofillHints.telephoneNumber),
                      Gap.gy6,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: ThemeButton.pill(innerPadding: ThemePadding.p1 * 1.5, textStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900), title: "  Send Verification Code  ", onTap: () => setState(() => codeSent = true), dark: true)),
                        ]
                      ),
                      Gap.gy4,
                      if (codeSent) const OTP(),
                      Gap.infinity,
                      Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "NEXT", bold: true, onTap: () => route(context, const SignUp2UserInformation()), color: ThemeColor.superRed)),
                      Progress(progress: codeSent ? 2 : 1, outOf: 7),
                      Gap.gy6
                    ])))));
  }
}
