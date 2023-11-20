import 'package:biyer_juti/component/bread_crumb.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/button.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          const BreadCrumb(["Account Settings", "Change Phone Number"]),
          Padding(
              padding: ThemePadding.p3,
              child: Column(children: [
                ThemeTextField.primary(
                    labelText: "Your Phone Number",
                    controller: TextEditingController(text: "+8801515644470"),
                    required: true,
                    keyboardType: TextInputType.phone,
                    autoFocus: true,
                    autofillHints: AutofillHints.telephoneNumber),
                Gap.gy2,
                Padding(padding: ThemePadding.px6, child: ThemeButton.pill(title: "Send Verification Code", onTap: () => setState(() => codeSent = true), dark: true)),
                Gap.gy4,
                if (codeSent) const OTP(),
                Gap.gy6,
                Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "Confirm", onTap: () => routeBack(context), color: ThemeColor.primary)),
                // Progress(progress: codeSent ? 2 : 1, outOf: 7),
                Gap.gy6
              ]))
        ]));
  }
}
