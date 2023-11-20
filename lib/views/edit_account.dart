import 'package:biyer_juti/component/bread_crumb.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/views/edit_my_profile.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/button.dart';
import '../component/text_field.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';
import '../util/page_navigation.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          const BreadCrumb(["Account Settings", "Edit Profile"]),
          Padding(
              padding: ThemePadding.p3,
              child: Column(children: [
                ThemeTextField.primary(
                    labelText: "Enter Password", controller: TextEditingController(), keyboardType: TextInputType.text, autofillHints: AutofillHints.password, autoFocus: true, isPassword: true),
                Text("If you confirm this page, your profile will be temporarily deactivated for reviewing your edits. It may take up to 4 days to reactivate your profile.",
                    textAlign: TextAlign.justify, style: TextStyle(color: ThemeColor.navyBlue)),
                Gap.gy4,
                Text(
                    "আপনি যদি এই পৃষ্ঠাটি নিশ্চিত করেন তবে আপনার সম্পাদনাগুলি পর্যালোচনা করার জন্য আপনার প্রোফাইল সাময়িকভাবে নিষ্ক্রিয় করা হবে৷ আপনার প্রোফাইল পুনরায় সক্রিয় করতে ৪ (চার) দিন পর্যন্ত সময় লাগতে পারে৷",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: ThemeColor.navyBlue)),
                Gap.gy6,
                Row(children: [
                  ThemeButton.expandedPill(title: "Cancel", onTap: () => routeBack(context), icon: FeatherIcons.x, border: true),
                  Gap.gx2,
                  ThemeButton.expandedPill(title: "Edit Profile", onTap: () => route(context, const EditMyProfile(id: 0)), icon: FeatherIcons.userCheck, dark: true)
                ])
              ])),
          Gap.gy6,
        ]));
  }
}
