import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/match.dart';
import 'package:biyer_juti/views/notification.dart';
import 'package:biyer_juti/views/profile.dart';
import 'package:biyer_juti/views/search.dart';
import 'package:biyer_juti/views/sign_in.dart';
import 'package:biyer_juti/views/upgrade_to_premium.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../component/popup_menu.dart';
import '../views/home.dart';
import '../views/online.dart';
import '../views/profile_viewer.dart';

List<PopupMenuEntry> appMenu(BuildContext context) => [
      menuItem(label: "My Profile", icon: FeatherIcons.user, onTap: () => route(context, const Profile(myProfile: true))),
      menuItem(label: "Notification", icon: FeatherIcons.bell, onTap: () => route(context, const Notifications())),
      menuItem(label: "Search", icon: FeatherIcons.search, onTap: () => route(context, const Search())),
      menuItem(label: "Hearts Received", icon: FeatherIcons.heart, onTap: () => route(context, const Home())),
      menuItem(label: "Matches", icon: FeatherIcons.gitPullRequest, onTap: () => route(context, const Match())),
      menuItem(label: "Profile Viewers", icon: FeatherIcons.eye, onTap: () => route(context, const ProfileViewer())),
      menuItem(label: "Online Users", icon: FeatherIcons.users, onTap: () => route(context, const Online())),
      menuItem(label: "Choose Viewers", icon: FeatherIcons.mousePointer),
      menuItem(label: "Billing", icon: FeatherIcons.creditCard, onTap: () => route(context, const UpgradeToPremium())),
      menuItem(label: "Settings", icon: FeatherIcons.settings),
      menuItem(label: "Contact Us", icon: FeatherIcons.phone),
      menuItem(label: "Logout", icon: FeatherIcons.logOut, onTap: () => routeNoBack(context, const SignIn())),
    ];
