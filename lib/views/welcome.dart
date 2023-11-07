import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/sign_in.dart';
import 'package:biyer_juti/views/sign_up_1_basic_information.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/biyer_juti_backdrop.jpg"), fit: BoxFit.cover)),
            child: Container(
                padding: ThemePadding.p4,
                decoration: BoxDecoration(gradient: ThemeGradient.semiTransparentWhite),
                child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(padding: ThemePadding.px6, child: ThemeButton.primary(title: "SIGN IN", onTap: () => route(context, const SignIn()), color: Colors.white, darkText: true, border: true)),
                  Padding(padding: ThemePadding.px6, child: ThemeButton.primary(title: "CREATE PROFILE", onTap: () => route(context, const SignUp1BasicInformation()), gradient: ThemeGradient.secondary)),
                  Padding(padding: ThemePadding.p4, child: Image.asset("assets/logo-wide.png", height: 75)),
                ]))));
  }
}
