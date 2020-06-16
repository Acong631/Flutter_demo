import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_demo/home_page.dart';
import 'package:widgets_demo/routes.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow,
        brightness: Brightness.light,

        highlightColor: Colors.transparent,
        splashColor: Colors.transparent
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}