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
import '../views/choose_viewers.dart';
import '../views/contact_us.dart';
import '../views/home.dart';
import '../views/online.dart';
import '../views/profile_viewer.dart';

List<PopupMenuEntry> appMenu(BuildContext context) => [
      menuItem(index: 0, label: "My Profile", icon: FeatherIcons.user, onTap: () => route(context, const Profile(myProfile: true))),
      menuItem(index: 1, label: "Notification", icon: FeatherIcons.bell, onTap: () => route(context, const Notifications())),
      menuItem(index: 2, label: "Search", icon: FeatherIcons.search, onTap: () => route(context, const Search())),
      menuItem(index: 3, label: "Hearts Received", icon: FeatherIcons.heart, onTap: () => route(context, const Home())),
      menuItem(index: 4, label: "Matches", icon: FeatherIcons.gitPullRequest, onTap: () => route(context, const Match())),
      menuItem(index: 5, label: "Profile Viewers", icon: FeatherIcons.eye, onTap: () => route(context, const ProfileViewer())),
      menuItem(index: 6, label: "Online Users", icon: FeatherIcons.users, onTap: () => route(context, const Online())),
      menuItem(index: 7, label: "Choose Viewers", icon: FeatherIcons.mousePointer, onTap: () => route(context, const ChooseViewers())),
      menuItem(index: 8, label: "Billing", icon: FeatherIcons.creditCard, onTap: () => route(context, const UpgradeToPremium())),
      menuItem(index: 9, label: "Settings", icon: FeatherIcons.settings),
      menuItem(index: 10, label: "Contact Us", icon: FeatherIcons.phone, onTap: () => route(context, const ContactUs())),
      menuItem(index: 11, label: "Logout", icon: FeatherIcons.logOut, onTap: () => routeNoBack(context, const SignIn())),
      footerItem(index: 12, toAbout: () {}, toTnC: () {}, toPrivacy: () {}, toARefund: () {})
    ];
