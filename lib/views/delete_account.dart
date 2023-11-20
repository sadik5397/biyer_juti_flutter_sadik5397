import 'package:biyer_juti/component/bread_crumb.dart';
import 'package:biyer_juti/component/custom_toggle_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/button.dart';
import '../component/text_field.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../util/page_navigation.dart';
import 'delete_account_confirm.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  List<bool> pass = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          const BreadCrumb(["Account Settings", "Delete Profile"]),
          Padding(
              padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 2),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const CustomToggleButton(label: "Please choose any of the following reasons for deleting your profile", options: ["I have found my life partner", "I do not want to keep profile here"]),
                if (pass[0]) const CustomToggleButton(label: "Did you find your life partner in BiyerJuti?", options: ["Yes I have", "No I haven’t"]),
                if (pass[1]) Padding(padding: ThemePadding.pb4, child: Text("Write your feedback for BiyerJuti", style: TextStyle(color: ThemeColor.navyBlue))),
                if (pass[1]) ThemeTextField.primary(labelText: "Your Feedback", controller: TextEditingController(), keyboardType: TextInputType.text, maxLines: 8),
                if (pass[1]) Gap.gy6,
                Row(children: [
                  ThemeButton.expandedPill(title: "Cancel", onTap: () => routeBack(context), icon: FeatherIcons.x, border: true),
                  Gap.gx2,
                  if (!pass[0]) ThemeButton.expandedPill(title: "Next", onTap: () => setState(() => pass[0] = true), icon: FeatherIcons.userCheck, dark: true),
                  if (pass[0]) ThemeButton.expandedPill(title: "Next", onTap: () => route(context, const DeleteProfileConfirm()), icon: FeatherIcons.userCheck, dark: true)
                ])
              ])),
          Gap.gy6,
        ]));
  }
}
