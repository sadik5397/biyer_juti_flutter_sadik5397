import 'package:biyer_juti/component/bread_crumb.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../component/app_bar.dart';
import '../component/button.dart';
import '../component/text_field.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../util/page_navigation.dart';
import 'home.dart';

class DeleteProfileConfirm extends StatefulWidget {
  const DeleteProfileConfirm({Key? key}) : super(key: key);

  @override
  State<DeleteProfileConfirm> createState() => _DeleteProfileConfirmState();
}

class _DeleteProfileConfirmState extends State<DeleteProfileConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          const BreadCrumb(["Account Settings", "Delete Profile", "Confirm"]),
          Padding(
              padding: ThemePadding.p3,
              child: Column(children: [
                ThemeTextField.primary(
                    labelText: "Enter Password", controller: TextEditingController(), keyboardType: TextInputType.text, autofillHints: AutofillHints.password, autoFocus: true, isPassword: true),
                Row(children: [
                  SvgPicture.asset("assets/svg/alert.svg"),
                  Gap.gx2,
                  Expanded(child: Text("Note that, your profile will be permanently deleted if you click the delete button below.", style: TextStyle(color: ThemeColor.primary)))
                ]),
                Gap.gy6,
                Row(children: [
                  ThemeButton.expandedPill(title: "Cancel", onTap: () => routeBack(context), icon: FeatherIcons.x, dark: true),
                  Gap.gx2,
                  ThemeButton.expandedPill(title: "Delete Profile", onTap: () => routeNoBack(context, const Home()), icon: FeatherIcons.trash2, border: true)
                ])
              ])),
          Gap.gy6,
        ]));
  }
}
