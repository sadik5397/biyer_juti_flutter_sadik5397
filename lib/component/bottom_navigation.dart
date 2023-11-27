import 'package:biyer_juti/component/hyperlink.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';
import '../views/notification.dart';
import '../views/profile.dart';
import '../views/search.dart';

List<Widget> pages = const [Search(), Home(), Notifications(), Profile(myProfile: true)];

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
        height: 75,
        destinations: [
          ThemeNavigationItem(svgIcon: "search", label: "Search", selected: widget.currentIndex == 0, index: 0),
          ThemeNavigationItem(svgIcon: "match", label: "Home", selected: widget.currentIndex == 1, index: 1),
          ThemeNavigationItem(svgIcon: "notification", label: "Notification", selected: widget.currentIndex == 2, index: 2),
          ThemeNavigationItem(svgIcon: "my_profile", label: "Profile", selected: widget.currentIndex == 3, index: 3),
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
  const ThemeNavigationItem({super.key, required this.selected, required this.label, required this.svgIcon, required this.index});

  final bool selected;
  final String svgIcon;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      AnimatedCrossFade(
          firstChild: Hyperlink(
              onTap: () => routeNoBackNoAnimation(context, pages[index]),
              // ignore: deprecated_member_use
              child: Padding(padding: ThemePadding.p4, child: SvgPicture.asset("assets/menu/$svgIcon.svg", color: ThemeColor.jetBlack.withOpacity(.5), width: 18))),
          // ignore: deprecated_member_use
          secondChild: SvgPicture.asset("assets/menu/$svgIcon.svg", width: 24, color: ThemeColor.primary),
          crossFadeState: selected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration.zero),
      if (selected) Text("●", style: TextStyle(color: ThemeColor.primary))
    ]);
    // return NavigationDestination(
    //     // ignore: deprecated_member_use
    //     icon: SvgPicture.asset("assets/menu/$svgIcon.svg", color: ThemeColor.jetBlack.withOpacity(.5), width: 18),
    //     label: "●",
    //     tooltip: label,
    //     selectedIcon: SvgPicture.asset("assets/menu/$svgIcon.svg", width: 24));
  }
}
