import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/home.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../views/notification.dart';
import '../views/profile.dart';
import '../views/search.dart';

List<Widget> pages = const [Home(), Search(), Notifications(), Profile(myProfile: true)];

class ThemeNavigation extends StatefulWidget {
  const ThemeNavigation({Key? key, required this.currentIndex}) : super(key: key);
  final int currentIndex;

  // final Function(int index) onChanged;

  @override
  State<ThemeNavigation> createState() => _ThemeNavigationState();
}

class _ThemeNavigationState extends State<ThemeNavigation> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        destinations: const [
          ThemeNavigationItem(icon: FeatherIcons.home, label: "Home"),
          ThemeNavigationItem(icon: FeatherIcons.search, label: "Search"),
          ThemeNavigationItem(icon: FeatherIcons.bell, label: "Notification"),
          ThemeNavigationItem(icon: FeatherIcons.user, label: "Profile")
        ],
        animationDuration: const Duration(milliseconds: 450),
        selectedIndex: widget.currentIndex,
        onDestinationSelected: (index) => routeNoBackNoAnimation(context, pages[index]),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Colors.transparent,
        indicatorColor: ThemeColor.secondary.withOpacity(.1),
        elevation: 0);
  }
}

class ThemeNavigationItem extends StatelessWidget {
  const ThemeNavigationItem({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(icon, color: ThemeColor.jetBlack.withOpacity(.5), size: 24),
      label: label,
      tooltip: label,
      selectedIcon: Icon(icon, color: ThemeColor.primary, size: 18),
    );
  }
}
