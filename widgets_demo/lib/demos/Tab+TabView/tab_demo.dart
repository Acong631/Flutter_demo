import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget {
  TabDemo({Key key}) : super(key: key);

  @override
  _TabDemoState createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> with SingleTickerProviderStateMixin{
  TabController ctr;
  List<String> titles = ['推荐','丽人','旅游','电影','游戏','购物推荐','教育','婚姻','娱乐','美食','电竞比赛'];

  @override
  void initState() {
     ctr = TabController(length: titles.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Demo'),
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black38,
          unselectedLabelStyle: TextStyle(fontSize: 15),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
          controller: ctr,
          isScrollable: true,
          tabs:titles.map((title){
            return Tab(
              text: title,
            );
          }).toList()
        ),
      ),
      body: TabBarView(
        controller: ctr,
        children: titles.map((title){
          return Container(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          );
        }).toList()
      ),
    );
  }
}