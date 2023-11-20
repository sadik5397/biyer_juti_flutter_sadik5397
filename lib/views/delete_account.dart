import 'package:biyer_juti/component/bread_crumb.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/button.dart';
import '../component/text_field.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../util/page_navigation.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          const BreadCrumb(["Account Settings", "Delete Profile"]),
          Padding(
              padding: ThemePadding.p3,
              child: Column(children: [
                ThemeTextField.primary(labelText: "Enter Current Email", controller: TextEditingController(), keyboardType: TextInputType.emailAddress, autofillHints: AutofillHints.email, autoFocus: true),
                ThemeTextField.primary(labelText: "Enter New Email", controller: TextEditingController(), keyboardType: TextInputType.emailAddress, autofillHints: AutofillHints.email),
                ThemeTextField.primary(labelText: "Re-Enter New Email", controller: TextEditingController(), keyboardType: TextInputType.emailAddress, autofillHints: AutofillHints.email),
                Gap.gy6,
                Row(children: [
                  ThemeButton.expandedPill(title: "Cancel", onTap: () => routeBack(context), icon: FeatherIcons.x, border: true),
                  Gap.gx2,
                  ThemeButton.expandedPill(title: "Confirm Delete", onTap: () => routeBack(context), icon: FeatherIcons.userCheck, dark: true)
                ])
              ])),
          Gap.gy6,
        ]));
  }
}
