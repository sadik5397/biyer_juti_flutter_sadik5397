import 'package:biyer_juti/component/bread_crumb.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../component/app_bar.dart';
import '../component/button.dart';
import '../component/text_field.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../util/page_navigation.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  bool currentEmailAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          const BreadCrumb(["Account Settings", "Change Email"]),
          Padding(
              padding: ThemePadding.p3,
              child: Column(children: [
                if (!currentEmailAccepted)
                  ThemeTextField.primary(labelText: "Enter Current Email", controller: TextEditingController(), keyboardType: TextInputType.emailAddress, autofillHints: AutofillHints.email, autoFocus: true),
                if (currentEmailAccepted) ThemeTextField.primary(labelText: "Enter New Email", controller: TextEditingController(), keyboardType: TextInputType.emailAddress, autofillHints: AutofillHints.email),
                if (currentEmailAccepted)
                  ThemeTextField.primary(labelText: "Re-Enter New Email", controller: TextEditingController(), keyboardType: TextInputType.emailAddress, autofillHints: AutofillHints.email),
                Gap.gy6,
                Row(children: [
                  if (!currentEmailAccepted)
                    ThemeButton.expandedPill(boldTitle: true, title: "Cancel", onTap: () => routeBack(context), icon: FeatherIcons.x, border: true, smallSize: true, iconRightSide: true, dark: true),
                  if (!currentEmailAccepted) Gap.gx2,
                  if (!currentEmailAccepted)
                    ThemeButton.expandedPill(
                        boldTitle: true,
                        title: "Next",
                        onTap: () => setState(() => currentEmailAccepted = true),
                        icon: FeatherIcons.chevronRight,
                        titleColor: ThemeColor.jetBlack,
                        color: HexColor("#c2c7d0"),
                        smallSize: true,
                        iconRightSide: true),
                  if (currentEmailAccepted) ThemeButton.expandedPill(boldTitle: true, title: "Confirm New Email", onTap: () => routeBack(context), dark: true, smallSize: true, iconRightSide: true)
                ])
              ])),
          Gap.gy6,
        ]));
  }
}
