import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_demo/routes.dart';


class TitlePage{
  String title;
  String routesName;

  TitlePage({
    @required this.title,
    @required this.routesName
  });
}


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<TitlePage> titlePages = [
    TitlePage(title: 'Tab + TabView', routesName: AppRoutes.tabPage),
    TitlePage(title: 'BottomBar', routesName: AppRoutes.bottomBarPage),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widgets'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index){
          return ListTile(
            contentPadding: EdgeInsets.all(8),
            title: Text(titlePages[index].title),
            onTap: (){
              Navigator.pushNamed(context, titlePages[index].routesName);
            },
          );
        }, 
        separatorBuilder: (context, index){
          return Container(
            height: 5,
            color: CupertinoColors.inactiveGray.withAlpha(30)
          );
        }, 
        itemCount: titlePages.length
      ),
    );
  }
}