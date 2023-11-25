import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/account_settings.dart';
import 'package:biyer_juti/views/long_text.dart';
import 'package:biyer_juti/views/match.dart';
import 'package:biyer_juti/views/notification.dart';
import 'package:biyer_juti/views/profile.dart';
import 'package:biyer_juti/views/search.dart';
import 'package:biyer_juti/views/sign_in.dart';
import 'package:biyer_juti/views/upgrade_to_premium.dart';
import 'package:flutter/material.dart';

import '../component/popup_menu.dart';
import '../views/choose_viewers.dart';
import '../views/contact_us.dart';
import '../views/home.dart';
import '../views/online.dart';
import '../views/profile_viewer.dart';

List<PopupMenuEntry> appMenu(BuildContext context) => [
      menuItem(index: 0, context: context, label: "My Profile", icon: "my_profile", onTap: () => route(context, const Profile(myProfile: true))),
      menuItem(index: 1, context: context, label: "Notification", icon: "notification", onTap: () => route(context, const Notifications())),
      menuItem(index: 2, context: context, label: "Search", icon: "search", onTap: () => route(context, const Search())),
      menuItem(index: 3, context: context, label: "Hearts Received", icon: "heart_rcvd", onTap: () => route(context, const Home())),
      menuItem(index: 4, context: context, label: "Matches", icon: "match", onTap: () => route(context, const Match())),
      menuItem(index: 5, context: context, premiumFeature: true, label: "Profile Viewers", icon: "profile_viewers", onTap: () => route(context, const ProfileViewer())),
      menuItem(index: 6, context: context, premiumFeature: true, label: "Online Users", icon: "online_users", onTap: () => route(context, const Online())),
      menuItem(index: 7, context: context, premiumFeature: true, label: "Choose Viewers", icon: "choose_viewers", onTap: () => route(context, const ChooseViewers()), lastItem: true),
      menuItem(index: 8, context: context, label: "Billing", icon: "billing", onTap: () => route(context, const UpgradeToPremium())),
      menuItem(index: 9, context: context, label: "Settings", icon: "settings", onTap: () => route(context, const AccountSettings())),
      menuItem(index: 10, context: context, label: "Contact Us", icon: "contact_us", onTap: () => route(context, const ContactUs())),
      menuItem(index: 11, context: context, label: "Logout", icon: "logout", onTap: () => routeNoBack(context, const SignIn()), lastItem: true),
      footerItem(
          index: 12,
          context: context,
          toAbout: () => route(context, const LongText(pageName: "About Us")),
          toTnC: () => route(context, const LongText(pageName: "Terms & Conditions")),
          toPrivacy: () => route(context, const LongText(pageName: "Privacy Policy")),
          toRefund: () => route(context, const LongText(pageName: "Refund Policy")))
    ];
