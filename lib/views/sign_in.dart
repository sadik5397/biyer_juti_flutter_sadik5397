import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/text_field.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/forgot_password.dart';
import 'package:biyer_juti/views/sign_up_1_basic_information.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/biyer_juti_backdrop.jpg"), fit: BoxFit.cover)),
            child: Container(
                padding: ThemePadding.p4,
                decoration: BoxDecoration(gradient: ThemeGradient.qtrTransparentWhite),
                child: Padding(
                    padding: ThemePadding.px6,
                    child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      ThemeTextField.primary(
                          labelText: "Your Phone Number",
                          labelStyle: TextStyle(color: ThemeColor.primary.withOpacity(.5), fontSize: 14, fontWeight: FontWeight.bold),
                          controller: TextEditingController(text: "+880"),
                          required: true,
                          keyboardType: TextInputType.phone,
                          autoFocus: true,
                          autofillHints: AutofillHints.telephoneNumber),
                      ThemeTextField.primary(
                          labelText: "Your Password",
                          labelStyle: TextStyle(color: ThemeColor.primary.withOpacity(.5), fontSize: 14, fontWeight: FontWeight.bold),
                          controller: TextEditingController(),
                          required: true,
                          isPassword: true,
                          showPassword: showPassword,
                          autofillHints: AutofillHints.password,
                          showPasswordPressed: () => setState(() => showPassword = !showPassword)),
                      Gap.gy2,
                      ThemeButton.primary(title: "LOGIN", onTap: () => routeNoBack(context, const Home()), color: ThemeColor.superRed),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        ThemeButton.text(label: "Forgot Password", color: ThemeColor.red, weight: FontWeight.bold, onTap: () => route(context, const ForgotPassword())),
                        ThemeButton.text(label: "Create Profile", color: ThemeColor.secondary, weight: FontWeight.bold, onTap: () => route(context, const SignUp1BasicInformation()))
                      ]),
                      Gap.gy6
                    ])))));
  }
}
