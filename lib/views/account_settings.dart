import 'package:biyer_juti/component/basic_navigation_button.dart';
import 'package:flutter/material.dart';

import '../component/account_updateble_info.dart';
import '../component/app_bar.dart';
import '../component/section_header.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          const SectionHeader(label: "Account Settings", topGap: false),
          BasicNavigationButton(label: "Change Password", onTap: () {}),
          AccountUpdatableInfo(label: "Phone Number", onTapChange: () {}, value: "+8801515644470", verified: false),
          AccountUpdatableInfo(label: "Email", onTapChange: () {}, value: "+sadik5397@gmail.com", verified: true),
          BasicNavigationButton(label: "Edit Full Profile", onTap: () {}),
          BasicNavigationButton(label: "Delete Profile", onTap: () {}, lastItem: true),
          Gap.gy6,
        ]));
  }
}
