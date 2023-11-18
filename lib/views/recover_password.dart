import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/component/text_field.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/sign_in.dart';
import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  bool showPassword = false;
  bool shoConfirmPassword = false;

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
                      const SectionHeader(label: "Create New Password", topGap: false),
                      Gap.gy2,
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
                      Padding(padding: ThemePadding.px6, child: ThemeButton.primary(title: "Confirm New Password", onTap: () => route(context, const SignIn()), color: ThemeColor.primary)),
                      Gap.infinity,
                    ])))));
  }
}
