import 'package:flutter/material.dart';
import 'package:know_news/presentation/screens/business_screen.dart';
import 'package:know_news/presentation/screens/health_screen.dart';
import 'package:know_news/presentation/screens/science_screen.dart';
import 'package:know_news/presentation/screens/sports_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TabsScreen extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  TabsScreen({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const BusinessScreen(),
      const ScienceScreen(),
      const SportsScreen(),
      const HealthScreen(),
      //the ordering matters
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.business),
        title: ('Business'),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: const Color(0xffc1c1c1),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.science),
        title: ('Science'),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: const Color(0xffc1c1c1),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.sports,
        ),
        title: ('Sports'),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: const Color(0xffc1c1c1),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.health_and_safety),
        title: ('Health'),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: const Color(0xffc1c1c1),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}
