import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/profile.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../component/popup_menu.dart';

List<PopupMenuEntry> appMenu(BuildContext context) => [
      menuItem(label: "My Profile", icon: FeatherIcons.user, onTap: () => route(context, const Profile(myProfile: true))),
      menuItem(label: "Notification", icon: FeatherIcons.bell),
      menuItem(label: "Search", icon: FeatherIcons.search),
      menuItem(label: "Hearts Received", icon: FeatherIcons.heart),
      menuItem(label: "Matches", icon: FeatherIcons.gitPullRequest),
      menuItem(label: "Profile Viewers", icon: FeatherIcons.eye),
      menuItem(label: "Online Users", icon: FeatherIcons.users),
      menuItem(label: "Choose Viewers", icon: FeatherIcons.mousePointer),
      menuItem(label: "Billing", icon: FeatherIcons.creditCard),
      menuItem(label: "Settings", icon: FeatherIcons.settings),
      menuItem(label: "Contact Us", icon: FeatherIcons.phone),
      menuItem(label: "Logout", icon: FeatherIcons.logOut),
    ];
