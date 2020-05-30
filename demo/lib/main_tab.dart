import 'package:demo/pages/dynamic_page.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/mine_page.dart';
import 'package:demo/pages/sale_page.dart';
import 'package:demo/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTab extends StatefulWidget {
  MainTab({Key key}) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int currentIndex = 0;
  final pages = [HomePage(), SalePage(),DynamicPage(),MinePage()];

  _item(String title, IconData data, int index){
    Color color = index == currentIndex?ColorUtils.theamRed:ColorUtils.tabNormal;
    return BottomNavigationBarItem(
      icon: Icon(data,color:ColorUtils.tabNormal),
      title: Text(title,style: TextStyle(color:color),),
      activeIcon: Icon(data,color:ColorUtils.theamRed )
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 668, allowFontScaling: true);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          if(index != currentIndex){
            setState(() {
              currentIndex = index;
            });
          }
        },
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: [
          _item('首页', Icons.home,0),
          _item('买卖', Icons.home,1),
          _item('商圈', Icons.home,2),
          _item('我的', Icons.home,3),
        ],
      ),
    );
  }
}