import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/progress.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/component/text_field.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/home.dart';
import 'package:flutter/material.dart';

class SignUp2UserInformation extends StatefulWidget {
  const SignUp2UserInformation({super.key});

  @override
  State<SignUp2UserInformation> createState() => _SignUp2UserInformationState();
}

class _SignUp2UserInformationState extends State<SignUp2UserInformation> {
  bool showPassword = false;
  bool shoConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        appBar: ThemeAppBar.blank,
        body: ListView(padding: ThemePadding.px6, children: [
          Image.asset("assets/logo-wide.png", height: 75),
          const SectionHeader(label: "Account Information", topGap: false),
          Gap.gy2,
          ThemeTextField.primary(labelText: "Name", controller: TextEditingController(), required: true, keyboardType: TextInputType.name, autofillHints: AutofillHints.name, autoFocus: true),
          ThemeTextField.primary(labelText: "Gender", controller: TextEditingController(), required: true, keyboardType: TextInputType.text, autofillHints: AutofillHints.gender),
          ThemeTextField.primary(labelText: "Date of Birth", controller: TextEditingController(), required: true, keyboardType: TextInputType.datetime, autofillHints: AutofillHints.birthdayDay, isDate: true),
          ThemeTextField.primary(labelText: "Email", controller: TextEditingController(), required: true, keyboardType: TextInputType.emailAddress, autofillHints: AutofillHints.email),
          ThemeTextField.primary(
              labelText: "Password",
              controller: TextEditingController(),
              required: true,
              isPassword: true,
              showPassword: showPassword,
              autofillHints: AutofillHints.password,
              showPasswordPressed: () => setState(() => showPassword = !showPassword)),
          ThemeTextField.primary(
              labelText: "Re-enter Password",
              controller: TextEditingController(),
              required: true,
              isPassword: true,
              showPassword: shoConfirmPassword,
              autofillHints: AutofillHints.password,
              showPasswordPressed: () => setState(() => shoConfirmPassword = !shoConfirmPassword)),
          Gap.gy6,
          Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "NEXT", onTap: () => route(context, const Home()), color: ThemeColor.primary)),
          const Progress(progress: 3, outOf: 6),
          Gap.gy6
        ]));
  }
}
