import 'package:flutter/cupertino.dart';
import 'package:widgets_demo/demos/BottomNavigationBar/bottom_navigation_bar_demo.dart';
import 'package:widgets_demo/demos/Tab+TabView/tab_demo.dart';
import 'package:widgets_demo/home_page.dart';


class AppRoutes {
  static const String homePage = '/home';
  static const String tabPage = '/home/tab';
  static const String bottomBarPage = '/home/bottomNavigatioBar';
}

final Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.homePage:(BuildContext context) => HomePage(),
  AppRoutes.tabPage:(BuildContext context) => TabDemo(),
  AppRoutes.bottomBarPage:(BuildContext context) => BottomNavigationBarDemo(),
};