
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as sc;

class ColorUtils{
  static Color theamRed = Color.fromARGB(255, 203, 19, 58);
  static Color tabNormal = Color.fromARGB(255, 159, 159, 159);

  static Color titleColor = Colors.black;
  static final textColor = Color.fromRGBO(49, 49, 49, 1);
  static final minorTextColor = Color.fromRGBO(130, 130, 130, 1);
  static final lineColor = Color.fromRGBO(241, 241, 241, 1);
  static final pageColor =  Color.fromARGB(255, 245, 245, 245);
}

class ScreenUtils{
  static final width = sc.ScreenUtil.screenWidthDp;
  static final height = sc.ScreenUtil.screenHeightDp;
  static double fix(double size) => sc.ScreenUtil().setWidth(size);
}