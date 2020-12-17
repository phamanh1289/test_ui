import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:test_ui/home.scrent.dart';
import 'package:test_ui/resource/image.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  PersistentTabController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: false,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }

  List<Widget> _buildScreens() =>
      [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _itemBar("Tien ich", ic_utilities),
      _itemBar("San pham", ic_product),
      _itemBar("Tin tuc", ic_calendar),
      _itemBar("Tai khoan", ic_person),
    ];
  }

  _itemBar(String title, String image) => PersistentBottomNavBarItem(
      icon: Container(
        width: double.infinity,
        child: ImageIcon(AssetImage(image)),
      ),
      title: (title),
      activeColor: Colors.blue,
      inactiveColor: Colors.grey,
      titleFontSize: 13);
}
