import 'package:biyer_juti/component/bread_crumb.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/button.dart';
import '../component/text_field.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../util/page_navigation.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool currentPasswordAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          const BreadCrumb(["Account Settings", "Change Password"]),
          Padding(
              padding: ThemePadding.p3,
              child: Column(children: [
                if (!currentPasswordAccepted)
                  ThemeTextField.primary(
                      labelText: "Enter Current Password", controller: TextEditingController(), keyboardType: TextInputType.text, autofillHints: AutofillHints.password, autoFocus: true, isPassword: true),
                if (currentPasswordAccepted)
                  ThemeTextField.primary(labelText: "Enter New Password", controller: TextEditingController(), keyboardType: TextInputType.text, autofillHints: AutofillHints.newPassword, isPassword: true),
                if (currentPasswordAccepted)
                  ThemeTextField.primary(labelText: "Re-Enter New Password", controller: TextEditingController(), keyboardType: TextInputType.text, autofillHints: AutofillHints.newPassword, isPassword: true),
                Gap.gy6,
                Row(children: [
                  if (!currentPasswordAccepted) ThemeButton.expandedPill(title: "Cancel", onTap: () => routeBack(context), icon: FeatherIcons.x, border: true),
                  if (!currentPasswordAccepted) Gap.gx2,
                  if (!currentPasswordAccepted) ThemeButton.expandedPill(title: "Next", onTap: () => setState(() => currentPasswordAccepted = true), icon: FeatherIcons.chevronRight, dark: true),
                  if (currentPasswordAccepted) ThemeButton.expandedPill(title: "Confirm New Password", onTap: () => routeBack(context), icon: FeatherIcons.userCheck, dark: true)
                ])
              ])),
          Gap.gy6,
        ]));
  }
}
