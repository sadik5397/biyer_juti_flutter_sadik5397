import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        appBar: ThemeAppBar.blank,
        body: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: Padding(
                    padding: ThemePadding.px6,
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Image.asset("assets/logo-wide.png", height: 75),
                      const SectionHeader(label: "Basic Information", topGap: false),
                      Gap.gy2,
                      ThemeTextField.primary(
                          labelText: "Your Phone Number",
                          controller: TextEditingController(text: "+880"),
                          required: true,
                          keyboardType: TextInputType.phone,
                          autoFocus: true,
                          autofillHints: AutofillHints.telephoneNumber),
                      Gap.gy2,
                      Padding(padding: ThemePadding.px6, child: ThemeButton.pill(title: "Send Verification Code", onTap: () => setState(() => codeSent = true), dark: true)),
                      Gap.gy4,
                      if (codeSent) const OTP(),
                      Gap.infinity,
                      Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "NEXT", onTap: () => route(context, const SignUp2UserInformation()), color: ThemeColor.primary)),
                      Progress(progress: codeSent ? 2 : 1, outOf: 6),
                      Gap.gy6
                    ])))));
  }
}
