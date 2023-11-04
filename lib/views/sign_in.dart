import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/text_field.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

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
                decoration: BoxDecoration(gradient: ThemeGradient.semiTransparentWhite),
                child: Padding(
                  padding: ThemePadding.px6,
                  child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ThemeTextField.primary(labelText: "Your Phone Number", controller: TextEditingController(), required: true, keyboardType: TextInputType.phone),
                    ThemeTextField.primary(
                        labelText: "Your Password",
                        controller: TextEditingController(),
                        required: true,
                        isPassword: true,
                        showPassword: showPassword,
                        showPasswordPressed: () => setState(() => showPassword = !showPassword)),
                    Gap.gy2,
                    ThemeButton.primary(title: "SIGN IN", onTap: () {}, gradient: ThemeGradient.secondary),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ThemeButton.text(label: "Frgot Password", color: ThemeColor.primary, weight: FontWeight.bold, onTap: () {}),
                      ThemeButton.text(label: "Create Profile", color: ThemeColor.secondary, weight: FontWeight.bold, onTap: () {})
                    ]),
                    Gap.gy6
                  ]),
                ))));
  }
}
