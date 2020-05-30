import 'package:demo/utils.dart';
import 'package:demo/widgets/theam_tab_controll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DynamicPage extends StatefulWidget {
  DynamicPage({Key key}) : super(key: key);

  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> with SingleTickerProviderStateMixin{

  TabController tabCtr;

  @override
  void initState() {
    super.initState();
    tabCtr = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  _search(Function onTap){
    return Positioned(
      left: 10,
      child: GestureDetector(
        onTap: onTap,
        child: Icon(Icons.search),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              color: ColorUtils.pageColor,
              child: TheamTabView(tabCtr: tabCtr, titles: ['全部','我的'], pages: [DynamicView(),DynamicView()],tabWidth: 150,),
            ),
            _search((){

            }),
          ],
        ),
      ),
    );
  }
}

class DynamicView extends StatefulWidget {
  DynamicView({Key key}) : super(key: key);

  @override
  _DynamicViewState createState() => _DynamicViewState();
}

class _DynamicViewState extends State<DynamicView> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);



  _cellItem(int picCount){

    int n = picCount%6;
    _header(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network('https://profile.csdnimg.cn/8/F/0/3_iamonmyownway',width: 50,height: 50,fit: BoxFit.fill,),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('路飞',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 5,),
                  Text('成为海贼王的男人',style: TextStyle(fontSize: 13),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
    }

    _picture(){
      String pic = 'https://dss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1955876712.jpg';
      Widget widget;
      if(n == 0){
        widget = Container();
      }else if(n == 1){
        widget = Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Image.network(
            pic,
            width: ScreenUtils.width - 30,
            height: (ScreenUtils.width - 30)*0.45,
            fit: BoxFit.cover,
          ),
        );
      }else{
        widget = Container(
          padding: EdgeInsets.only(bottom: 10),
          height: (ScreenUtils.width - 60)/3,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Container(
                child: Image.network(
                  pic,
                  width: (ScreenUtils.width - 60)/3,
                  height: (ScreenUtils.width - 60)/3,
                  fit: BoxFit.cover,
                ),
              );
            }, 
            separatorBuilder: (context, index){
              return Container(width: 15,);
            }, 
            itemCount: n
          ),
        );
      }


      return widget;
    }

    _content(){
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，于1997年7月22日在集英社《周刊少年Jump》开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。',
          style: TextStyle(color: ColorUtils.textColor,fontSize: 14),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    _footer(){
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              '浏览量 1234',
               style: TextStyle(color: ColorUtils.minorTextColor,fontSize: 12),
            ),
            Expanded(child: Container()),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.favorite,size: 14,),
                  Text(
                    '1234',
                     style: TextStyle(color: ColorUtils.minorTextColor,fontSize: 12),
                  )
                ],
              ), 
              onTap: null
            ),
            SizedBox(width: 15,),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.favorite,size: 14,),
                  Text(
                    '1234',
                     style: TextStyle(color: ColorUtils.minorTextColor,fontSize: 12),
                  )
                ],
              ), 
              onTap: null
            )
            // IconButton(icon: Icon(Icons.favorite,size: 14,), onPressed: null),
            // IconButton(icon: Icon(Icons.favorite,size: 14,), onPressed: null)
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          _header(),
          _picture(),
          _content(),
          _footer()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SmartRefresher(
        controller: _refreshController, 
        enablePullDown: true,
        header: WaterDropHeader(),
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 1000));
          _refreshController.refreshCompleted();
        },
        child: ListView.separated(
          itemBuilder:(context, index){
            return _cellItem(index);
          }, 
          separatorBuilder: (context, index){
            return Container(
              height: 20,
              color: ColorUtils.pageColor,
            );
          }, 
          itemCount: 30
        ),
      ),
    );
  }
}