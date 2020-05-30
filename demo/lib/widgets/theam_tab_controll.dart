import 'package:demo/utils.dart';
import 'package:flutter/material.dart';

class TheamTabView extends StatefulWidget {
  final TabController tabCtr;
  final List<String> titles;
  final List<Widget> pages;
  final double tabHeight;
  final double tabWidth;
  TheamTabView({Key key,@required this.tabCtr,@required this.titles,@required this.pages, this.tabHeight = 30, this.tabWidth}) : super(key: key);

  @override
  _TheamTabViewState createState() => _TheamTabViewState();
}

class _TheamTabViewState extends State<TheamTabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: widget.tabHeight,
              width: widget.tabWidth??null,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom:
                          BorderSide(color: ColorUtils.lineColor, width: 1))),
              child: TabBar(
                onTap: (index) {
                  setState(() {});
                },
                labelColor: ColorUtils.theamRed,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: ColorUtils.theamRed,
                labelStyle: TextStyle(fontSize: 16),
                unselectedLabelStyle: TextStyle(fontSize: 14),
                controller: widget.tabCtr,
                tabs: widget.titles.map((title) => Text(title)).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: widget.pages,
                controller: widget.tabCtr,
              ),
            )
          ],
        ),
      );
  }
}