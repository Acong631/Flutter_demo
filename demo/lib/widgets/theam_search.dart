import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TheamSearch extends StatefulWidget {
  final String placeholder;
  final Function onTap;
  TheamSearch({Key key, this.placeholder, this.onTap}) : super(key: key);

  @override
  _TheamSearchState createState() => _TheamSearchState();
}

class _TheamSearchState extends State<TheamSearch> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
        padding: EdgeInsets.symmetric(horizontal: 10),
        prefix: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        prefixMode: OverlayVisibilityMode.notEditing,
        onTap: widget.onTap,
        placeholder: widget.placeholder??'',
        placeholderStyle: TextStyle(fontSize: 12, color: Colors.grey),
        style: TextStyle(fontSize: 12, color: Colors.black),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 236, 236),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1,
            )));
  }
}
