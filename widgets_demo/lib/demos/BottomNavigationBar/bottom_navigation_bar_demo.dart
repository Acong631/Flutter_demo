import 'package:flutter/material.dart';


class BarItem{
  Icon icon;
  String title;

  BarItem({
    @required this.icon,
    @required this.title
  });
}

class BottomNavigationBarDemo extends StatefulWidget {
  BottomNavigationBarDemo({Key key}) : super(key: key);

  @override
  _BottomNavigationBarDemoState createState() => _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  
  List<BarItem> items = [
    BarItem(icon: Icon(Icons.home), title: '首页'),
    BarItem(icon: Icon(Icons.message), title: '消息'),
    BarItem(icon: Icon(Icons.favorite), title: '喜好'),
    BarItem(icon: Icon(Icons.settings), title: '设置')
  ];
 
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: items.map((item){
          return BottomNavigationBarItem(
            icon: item.icon,
            title: Text(item.title),
          );
        }).toList(),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: items.map((item){
          return Container(
            child: Center(
              child: Text(
                item.title
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}