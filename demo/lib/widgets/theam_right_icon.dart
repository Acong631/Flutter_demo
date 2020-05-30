import 'package:flutter/material.dart';

class TheamRightIcon extends StatefulWidget {
  TheamRightIcon({Key key}) : super(key: key);

  @override
  _TheamRightIconState createState() => _TheamRightIconState();
}

class _TheamRightIconState extends State<TheamRightIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.chevron_right,color: Color.fromARGB(255, 213, 213, 213),);
  }
}